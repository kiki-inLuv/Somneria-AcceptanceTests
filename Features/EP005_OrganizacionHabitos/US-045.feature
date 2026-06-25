Feature: Planificación de Objetivos de Sueño

  Background:
    Given que el estudiante accede al módulo de organización de hábitos
    And se encuentra en la sección de planificación de objetivos de sueño

  Scenario: Objetivo configurado correctamente
    Given que el estudiante desea mejorar sus hábitos de descanso
    When configura un objetivo como "Dormir antes de las 23:00 horas" o "Mantener una rutina de descanso durante 7 días consecutivos" y confirma la información
    Then el sistema registra el objetivo
    And lo asocia a la rutina de hábitos del estudiante
    And lo incorpora al seguimiento diario
    And muestra el objetivo dentro del panel de organización de hábitos

  Scenario Outline: Objetivo incompleto
    Given que el estudiante se encuentra configurando un objetivo relacionado con sus hábitos de sueño
    When intenta guardar la información sin definir una meta o una condición de cumplimiento
    Then el sistema bloquea el registro
    And conserva la información previamente ingresada
    And muestra el mensaje: "Debe definir un objetivo válido para continuar."