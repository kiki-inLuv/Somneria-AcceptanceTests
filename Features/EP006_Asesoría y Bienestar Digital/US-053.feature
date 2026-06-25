Feature: Ajuste de Hábitos por Bajo Cumplimiento

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección de ajuste de hábitos por bajo cumplimiento

  Scenario: Sin evidencia suficiente
    Given que el estudiante registra menos de 7 días de actividad para un hábito de descanso
    When el sistema intenta generar recomendaciones de ajuste
    Then el sistema verifica que no existe suficiente información histórica para evaluar el nivel de cumplimiento del hábito
    And no genera sugerencias
    And muestra el mensaje: "No existen suficientes registros para generar recomendaciones."

  Scenario Outline: Sugerencia generada correctamente según el nivel de cumplimiento
    Given que el estudiante presenta un porcentaje de cumplimiento de "<porcentaje>" en un hábito de descanso durante los últimos 7 días
    When el sistema analiza el historial de hábitos registrados
    Then el sistema identifica el hábito con bajo cumplimiento
    And genera una sugerencia de tipo "<tipo_sugerencia>"
    And registra la recomendación
    And la muestra dentro del panel de organización de hábitos

    Examples:
      | porcentaje | tipo_sugerencia      |
      | 45%        | ajuste de horario    |
      | 30%        | ajuste de horario    |
      | 20%        | ajuste de frecuencia |