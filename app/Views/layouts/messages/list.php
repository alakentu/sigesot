<?php if (!empty($messages)) : ?>
	<div id="message" class="alert alert-sucsess col-12" role="alert">
		<ul class="list-unstyled mb-0">
			<?php foreach ($messages as $message) : ?>
				<li>
					<p class="fs-6 mb-0"><?= esc($message) ?></p>
				</li>
			<?php endforeach ?>
		</ul>
	</div>
<?php elseif (!empty($errors)) : ?>
	<div id="message" class="alert alert-danger col-12" role="alert">
		<?php foreach ($errors as $error) : ?>
			<p class="fs-6 mb-0"><?= esc($error) ?></p>
		<?php endforeach ?>
	</div>
<?php endif ?>