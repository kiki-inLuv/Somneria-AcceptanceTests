Feature: Visualización de Cumplimiento de Hábitos de Descanso

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección de visualización de cumplimiento de hábitos de descanso

  Scenario: Visualización generada correctamente
    Given que el estudiante ha registrado actividades relacionadas con su rutina de descanso durante al menos 7 días
    When accede a la sección de estadísticas de hábitos
    Then el sistema calcula el porcentaje de cumplimiento de cada hábito
    And genera gráficos de seguimiento semanal
    And identifica los hábitos más cumplidos
    And muestra la información en el panel de métricas

  Scenario: Datos insuficientes
    Given que el estudiante posee menos de 7 días de registros de hábitos
    When accede a la sección de estadísticas
    Then el sistema verifica que no se cumple el mínimo de información requerido para generar métricas de cumplimiento
    And no genera gráficos ni estadísticas agregadas
    And muestra únicamente los registros disponibles
    And presenta el mensaje: "Se requieren al menos 7 días de registros para generar estadísticas de hábitos."