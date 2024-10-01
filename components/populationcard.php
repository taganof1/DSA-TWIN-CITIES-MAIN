<div class="card w-100">
    <div class="card-body">
        <h5 class="text-muted">Population</h5>
        <?php if(isset($cityData['Population'])): ?>
            <h2><?php echo number_format($cityData['Population']);?></h2>
        <?php else: ?>
            <div class="alert alert-danger" role="alert">
                Error retrieving population data
            </div>
        <?php endif; ?>
    </div>
</div> 