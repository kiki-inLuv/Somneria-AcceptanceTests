Feature: Registro de Notas en Hábitos

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección de registro de notas en hábitos

  Scenario: Registro exitoso de nota
    Given que el estudiante accede al detalle de un hábito registrado durante el día actual
    When escribe una nota de hasta 300 caracteres describiendo información relevante sobre la actividad realizada y selecciona la opción "Guardar"
    Then el sistema almacena la nota asociada al hábito y a la fecha correspondiente
    And registra la información en el historial
    And muestra un indicador visual confirmando que existe una nota registrada

  Scenario Outline: Superación del límite permitido de caracteres
    Given que el estudiante se encuentra redactando una nota para uno de sus hábitos
    When intenta guardar un texto que supera el límite máximo de 300 caracteres permitido por la plataforma
    Then el sistema bloquea el registro
    And conserva el contenido ingresado
    And muestra el mensaje: "La nota supera el límite permitido de caracteres."