<div class="row">
    <!-- Sección de metadatos -->
    <div class="col-md-6">
        <table class="table table-bordered">
            <!-- 
                Muestra información básica del registro:
                - ID de auditoría
                - Tabla afectada
                - ID del registro modificado
                - Tipo de acción (INSERT/UPDATE/DELETE)
             -->
        </table>
    </div>
    
    <!-- Sección de contexto -->
    <div class="col-md-6">
        <table class="table table-bordered">
            <!-- 
                Muestra información contextual:
                - Usuario que realizó el cambio
                - Dirección IP
                - Fecha y hora exacta
             -->
        </table>
    </div>
</div>

<!-- Sección de datos comparativos -->
<div class="row mt-4">
    <!-- Datos anteriores (OLD) -->
    <div class="col-md-6">
        <div class="card">
            <div class="card-header bg-warning text-dark">
                <h6 class="mb-0">Datos Anteriores</h6>
            </div>
            <div class="card-body">
                <!-- Muestra snapshot de datos antes del cambio -->
                <pre><?= json_encode(json_decode($log['old_data'] ?? '{}'), JSON_PRETTY_PRINT) ?></pre>
            </div>
        </div>
    </div>
    
    <!-- Datos nuevos (NEW) -->
    <div class="col-md-6">
        <div class="card">
            <div class="card-header bg-success text-white">
                <h6 class="mb-0">Datos Nuevos</h6>
            </div>
            <div class="card-body">
                <!-- Muestra snapshot de datos después del cambio -->
                <pre><?= json_encode(json_decode($log['new_data'] ?? '{}'), JSON_PRETTY_PRINT) ?></pre>
            </div>
        </div>
    </div>
</div>