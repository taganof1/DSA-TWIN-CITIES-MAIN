<div class="card w-100">
    <div class="card-body">
        <h5 class="text-muted">Language</h5>
        <?php if(isset($cityData['Language']) && !empty($cityData['Language'])): ?>
            <h2><?php echo $cityData['Language']; ?></h2>
        <?php else: ?>
            <div class="alert alert-danger" role="alert">
                Error retrieving language data
            </div>
        <?php endif; ?>
    </div>
</div>