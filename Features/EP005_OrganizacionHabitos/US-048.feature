Feature: Obtención de Recompensas por Constancia

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección de obtención de recompensas por constancia

  Scenario: Recompensa obtenida correctamente
    Given que el estudiante ha cumplido una rutina de descanso durante 7 días consecutivos y alcanza el criterio definido para una recompensa
    When accede a la sección de logros y selecciona la opción de reclamar la recompensa disponible
    Then el sistema valida el cumplimiento de los requisitos
    And registra la recompensa obtenida
    And la incorpora al historial de logros
    And muestra una notificación de reconocimiento al estudiante

  Scenario: Sin evidencia suficiente
    Given que el estudiante aún no alcanza la cantidad mínima de días de cumplimiento requerida para una recompensa
    When intenta reclamar una recompensa bloqueada
    Then el sistema rechaza la solicitud
    And mantiene la recompensa en estado no disponible
    And muestra el mensaje: "Aún no cumples los requisitos necesarios para obtener esta recompensa."