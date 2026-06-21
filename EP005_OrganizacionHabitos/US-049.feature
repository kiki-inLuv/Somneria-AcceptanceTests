Feature: Modo Desconexión Nocturna

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección del modo desconexión nocturna

  Scenario: Modo activado correctamente
    Given que el estudiante tiene configurada una hora de descanso dentro de Somneria y desea iniciar su rutina nocturna
    When activa el Modo Desconexión 30 minutos antes de la hora programada para dormir
    Then el sistema inicia un temporizador
    And muestra actividades recomendadas de relajación
    And registra el inicio de la sesión
    And presenta herramientas de apoyo para favorecer la preparación al sueño

  Scenario: Configuración incompleta
    Given que el estudiante accede al Modo Desconexión
    When intenta activar la funcionalidad sin haber configurado previamente una hora de descanso
    Then el sistema bloquea la activación del modo
    And mantiene la configuración actual sin cambios
    And muestra el mensaje: "Debe definir una hora de descanso para utilizar el Modo Desconexión."