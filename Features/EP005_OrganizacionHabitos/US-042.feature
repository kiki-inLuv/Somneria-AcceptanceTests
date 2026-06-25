Feature: Registro de Progreso Diario

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección de registro de progreso diario

  Scenario: Registro exitoso de progreso
    Given que el estudiante tiene 5 hábitos programados para el día actual
    When marca como completado el hábito "Dejar el celular 30 minutos antes de dormir"
    Then el sistema registra el cumplimiento
    And actualiza el porcentaje de progreso diario de 60% a 80%
    And almacena el cambio en el historial
    And refleja el nuevo estado en el panel de hábitos

  Scenario Outline: Registro fuera de la fecha permitida
    Given que el estudiante accede a una fecha futura dentro del calendario de hábitos
    When intenta marcar un hábito como completado para un día que aún no ocurre
    Then el sistema valida la fecha seleccionada
    And identifica que corresponde a un día futuro
    And bloquea el registro del hábito
    And no almacena cambios en el historial
    And muestra el mensaje: "Solo es posible registrar hábitos del día actual o de fechas anteriores."