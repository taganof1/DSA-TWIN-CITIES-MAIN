<div class="card w-100">
    <div class="card-body">
        <h5 class="text-muted">Local Time</h5>
        <?php if(isset($cityData['Timezone'])): ?>
            <h1 id="localTime"></h1>
            <?php echo '<script type="text/javascript">const offset = ' . $cityData['Timezone'] . ';</script>'; ?>
        <?php else: ?>
            <div class="alert alert-danger" role="alert">
                Error retrieving local time data
            </div>
        <?php endif; ?>
    </div>
</div>
