<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Actualización de Ticket #<?= $ticket['id'] ?></title>
</head>

<body>
    <h2>Actualización en Ticket #<?= $ticket['id'] ?></h2>
    <p>Hola <?= esc($user['first_name'] ?? 'Usuario') ?>,</p>

    <p>Tu ticket ha sido actualizado:</p>

    <div style="background: #f5f5f5; padding: 15px; border-radius: 5px;">
        <h3><?= esc($ticket['title']) ?></h3>
        <p><strong>Estado actual:</strong> <?= ucfirst(str_replace('_', ' ', $ticket['status'])) ?></p>
        <p><strong>Actualización:</strong></p>
        <p><?= nl2br(esc($message)) ?></p>
    </div>

    <p>
        <a href="<?= base_url("tickets/view/{$ticket['id']}") ?>"
            style="background: #007bff; color: white; padding: 10px 15px; text-decoration: none; border-radius: 5px;">
            Ver Ticket
        </a>
    </p>

    <p>Gracias,<br>Equipo de Soporte</p>
</body>

</html>