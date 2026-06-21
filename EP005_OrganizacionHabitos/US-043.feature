Feature: Gestión del Historial de Hábitos

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección de gestión del historial de hábitos

  Scenario: Actualización exitosa del historial
    Given que el estudiante accede al historial de hábitos y selecciona una fecha de los últimos 7 días
    When modifica el estado de un hábito de "Pendiente" a "Completado" y confirma el cambio
    Then el sistema actualiza el registro correspondiente
    And recalcula el porcentaje de cumplimiento del día
    And actualiza las estadísticas asociadas
    And muestra el cambio reflejado en el historial

  Scenario Outline: Fecha no válida para modificación
    Given que el estudiante accede al historial de hábitos
    When intenta modificar un registro correspondiente a una fecha anterior a la creación del hábito seleccionado
    Then el sistema bloquea la modificación
    And conserva los registros existentes
    And muestra el mensaje: "No es posible registrar progreso antes de la fecha de creación del hábito."