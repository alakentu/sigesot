<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title><?= esc($ticket['title']) ?></title>
</head>

<body>
    <h2>Nuevo Ticket Asignado</h2>
    <p>Hola <?= esc($technician['first_name'] ?? 'Técnico') ?>,</p>

    <p>Se te ha asignado un nuevo ticket:</p>

    <div style="background: #f5f5f5; padding: 15px; border-radius: 5px;">
        <h3>Ticket #<?= $ticket['id'] ?>: <?= esc($ticket['title']) ?></h3>
        <p><strong>Prioridad:</strong> <?= ucfirst($ticket['priority']) ?></p>
        <p><strong>Descripción:</strong></p>
        <p><?= nl2br(esc($ticket['description'])) ?></p>
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