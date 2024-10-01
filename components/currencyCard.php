<?php
function getCurrencyRates($symbol)
{
    // Check if cache file exists and is less than 2 hours old
    if (file_exists(CURRENCY_CACHE_FILE) && time() - filemtime(CURRENCY_CACHE_FILE) < CURRENCY_CACHE_DURATION) // This should be loaded from the config file
    {
        $currencyCacheData = file_get_contents(CURRENCY_CACHE_FILE);
        $exchangeRates = json_decode($currencyCacheData, true);

        if ($exchangeRates && isset($exchangeRates[$symbol])) {
            return '<p class="mb-0">1 GBP = ' . round($exchangeRates[$symbol][$symbol], 2) . ' ' . $symbol . '</p>';
        }
    }

    $baseCurrency = 'EUR'; // Default set by the currency API

    $currencyApiUrl = CURRENCY_API_URL . CURRENCY_API_KEY . '&base=' . $baseCurrency;
    $currencyApiResponse = file_get_contents($currencyApiUrl);
    $exchangeRates = json_decode($currencyApiResponse, true);

    if ($exchangeRates && $exchangeRates['success'] ?? false && $exchangeRates['rates'] ?? false) {
        $newBase = 'GBP';
        $newBaseRate = 1 / $exchangeRates['rates'][$newBase];

        $convertedRates = [$newBase => 1];
        foreach ($exchangeRates['rates'] as $currency => $rate) {
            if ($currency !== $newBase) {
                $convertedRates[$currency] = $rate * $newBaseRate;
            }
        }

        // Update cache with new data
        if (file_exists(CURRENCY_CACHE_FILE)) {
            $existingCurrencyCache = json_decode(file_get_contents(CURRENCY_CACHE_FILE), true);
            $existingCurrencyCache[$symbol] = $convertedRates;
        } else {
            $existingCurrencyCache = [$symbol => $convertedRates];
        }

        $currencyCacheData = json_encode($existingCurrencyCache);
        file_put_contents(CURRENCY_CACHE_FILE, $currencyCacheData);

        return '<p class="mb-0">1 ' . $newBase . ' = ' . round($convertedRates[$symbol], 2) . ' ' . $symbol . '</p>';
    } else {
        return '<div class="alert alert-danger" role="alert">Error occurred fetching currency data</div>';
    }
}

?>

<div class="card w-100">
    <div class="card-body">
        <h5 class="text-muted">Currency</h5>
        <h2>
            <?php echo $cityData['Currency']; ?>
        </h2>

        <?php
        if ($cityData['CurrencyCode'] != 'GBP') {
            echo getCurrencyRates($cityData['CurrencyCode']);
        }
        ?>

    </div>
</div>