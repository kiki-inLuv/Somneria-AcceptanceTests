Feature: Identificación de Habits que Favorecen el Descanso

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección de identificación de hábitos que favorecen el descanso

  Scenario: Datos insuficientes para el análisis
    Given que el estudiante posee menos de 14 días de registros de hábitos o información insuficiente de descanso
    When solicita el análisis de hábitos
    Then el sistema determina que los datos disponibles no son suficientes para realizar el análisis
    And no genera resultados
    And muestra el mensaje: "Se requieren más datos para identificar hábitos asociados a mejoras en el descanso."

  Scenario Outline: Identificación realizada correctamente según la constancia
    Given que el estudiante cuenta con al menos 14 días de registros de hábitos y datos de descanso almacenados en la plataforma
    When el sistema detecta una constancia de "<dias_seguidos>" días seguidos en el hábito de "<habito>"
    Then el sistema evalúa los hábitos registrados
    And identifica que este hábito está asociado a mejores indicadores de descanso
    And genera un resumen personalizado clasificándolo como "<impacto>"
    And muestra los resultados en el panel de hábitos

    Examples:
      | dias_seguidos | habito                       | impacto      |
      | 15            | Dormir antes de las 23:00    | Impacto Alto |
      | 14            | Reducir cafeína por la tarde | Impacto Medio|
      | 20            | Evitar pantallas de noche    | Impacto Alto |