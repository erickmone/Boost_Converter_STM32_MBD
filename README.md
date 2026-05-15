# Boost Converter for Model-Based Design and Embedded Control

This repository contains the hardware, simulation, modeling, and embedded-control resources developed for a **DC-DC boost converter**. The project is intended as a complete workflow for power electronics experimentation, including schematic design, PCB layout, analytical modeling, simulation, communication tests, and model-based design validation using MATLAB/Simulink.

The converter is designed as a boost-type power stage with an input voltage range from **12 V to 24 V**, a nominal output voltage of **42 V**, and a maximum output current of **5 A**. The general architecture includes the power converter, auxiliary power supply, MOSFET gate driver stage, voltage and current sensing adaptation circuits, and a microcontroller-based digital control platform operating with a PWM frequency of **500 kHz**. The block diagram included in this repository summarizes the complete system-level structure, including the power stage, sensing interface, driver, ADC acquisition, and auxiliary supply paths. :contentReference[oaicite:0]{index=0}

## Repository Structure

The repository is organized into several folders according to the main development stages of the project:

- `HW/Boost_Converter_V1.0`  
  Contains the hardware design files for the boost converter, including the PCB layout developed in **Altium Designer**.

- `INKSCAPE`  
  Includes schematic illustrations, block diagrams, and graphical material prepared using **Inkscape**. These files are useful for documentation, presentations, and technical explanations of the converter architecture.

- `MAPLE`  
  Contains symbolic calculations and additional analytical developments performed in **Maple**. These files may include derivations of converter equations, transfer functions, or supporting mathematical expressions.

- `Modbus Poll`  
  Includes material related to communication tests using **Modbus**, mainly for validating data exchange between the converter control system and external monitoring tools.

- `Papers`  
  Contains selected references and technical papers related to boost converters, digital control, power electronics modeling, and model-based design methodologies.

- `Simulation`  
  Includes simulation resources used to validate the converter operation before or alongside hardware implementation.

- `LEDtest.slxc`  
  A basic Simulink test model used to validate the embedded workflow, deployment process, and microcontroller output behavior.

- `PWM_STM32_g431xx_Boost_Converter.slx`  
  Simulink model for PWM generation on the STM32G431 platform.

- `PWM_STM32_g431xx_Boost_Converter_ADC_...slx`  
  Simulink model focused on ADC acquisition tests for voltage and current measurements.

- `PWM_STM32_g431xx_Boost_Converter_Contr...slx`  
  Simulink model including the first digital control implementation, based on a PI controller.

- `Startup_Parameters.m`  
  MATLAB script containing initialization parameters used by the Simulink models.

- `Transfer_Functions_Boost_STM32.m`  
  MATLAB script for defining and analyzing boost converter transfer functions.

- `regiones_Boost_STM32.m`  
  MATLAB script associated with the analysis of control regions or stability-related computations.

## Project Overview

The main goal of this repository is to document and validate a complete development process for a digitally controlled boost converter. The workflow combines classical power electronics design, simulation-based validation, and embedded implementation through model-based design.

The project includes:

1. **Power stage design**  
   The converter is based on a boost topology designed for low-voltage DC input and a regulated higher-voltage DC output.

2. **Hardware development**  
   The PCB layout is developed in Altium Designer and includes the main power stage, sensing circuits, auxiliary power supply, and interface connections for digital control.

3. **Graphical documentation**  
   System diagrams and converter illustrations are prepared in Inkscape to support documentation, presentations, and educational material.

4. **Analytical modeling**  
   Symbolic and numerical calculations are included to support the derivation of the dynamic model, transfer functions, and control-oriented representations.

5. **Model-based design validation**  
   Several Simulink models are included to validate the embedded workflow step by step, starting from basic LED tests, then PWM generation, ADC acquisition, and finally digital PI control.

6. **Communication testing**  
   Modbus-related files are included for communication and monitoring experiments.

7. **Experimental visualization**  
   Additional PDF diagrams and visual resources are included to document the overall architecture, signal flow, and system-level integration.

## Hardware Specifications

The preliminary system specifications are:

| Parameter | Value |
|---|---:|
| Converter topology | Boost converter |
| Input voltage range | 12 V – 24 V |
| Maximum input current | 10 A |
| Output voltage | 42 V |
| Maximum output current | 5 A |
| PWM frequency | 500 kHz |
| Control platform | STM32G431-based microcontroller |
| Control approach | Digital PI control |
| Sensing | Voltage and current ADC acquisition |
| Auxiliary supplies | 5 V and 3.3 V |

## Model-Based Design Tests

This repository includes several Simulink-based tests for embedded validation. The workflow follows a progressive strategy:

1. **LED test**  
   Basic deployment and GPIO validation on the target microcontroller.

2. **PWM generation test**  
   Validation of high-frequency PWM generation for the MOSFET gate driver.

3. **ADC acquisition test**  
   Verification of voltage and current measurement channels.

4. **Digital PI controller test**  
   First closed-loop control implementation for the boost converter.

This progressive validation approach makes it easier to isolate hardware, firmware, and control-design issues before integrating the complete system.

## Visualization and Documentation

The repository also includes visual documentation files, such as block diagrams and schematic illustrations. These resources are intended to make the project easier to understand from a system-level perspective.

The general block diagram describes the interaction between:

- DC input power supply,
- boost power stage,
- MOSFET gate driver,
- microcontroller,
- ADC sensing and adaptation circuits,
- auxiliary 5 V and 3.3 V power supplies,
- output load.

These visual elements are especially useful for tutorials, reports, presentations, and future educational material.

## Videos

A future section will include videos showing experimental tests and development progress. Possible video topics include:

- Hardware overview of the boost converter PCB.
- PWM generation test using STM32 and Simulink.
- ADC acquisition for voltage and current sensing.
- First open-loop experiments.
- Digital PI controller validation.
- Modbus-based monitoring.
- Complete system demonstration.

Video links will be added here as the tests are documented.

## Notes

Some files and scripts may include additional packages, preliminary variables, or unused sections. These elements are intentionally preserved because the repository is expected to evolve toward more advanced control-oriented tasks, including transfer-function analysis, stability-region computation, and digital controller validation.

Most of the material is currently organized as a development repository. Future updates may include a complete tutorial, additional experimental results, and a more detailed explanation of the mathematical modeling and embedded implementation.

## Author

Developed by:

- [@erickmone](https://www.github.com/erickmone)

You can also follow my academic work here:

- [Google Scholar](https://scholar.google.com/citations?hl=es&user=TdECTdoAAAAJ)

## Acknowledgments

This project is part of an ongoing effort to develop, validate, and document power electronics converters using simulation, hardware design, and model-based embedded control tools.

Special emphasis is placed on reproducible workflows for power electronics education and research, combining tools such as:

- MATLAB/Simulink,
- STM32 embedded targets,
- Altium Designer,
- Maple,
- Inkscape,
- Modbus-based communication tools.

---

![NopaLabs Logo](https://github.com/erickmone/ODE.DC-DC.Converter/blob/main/NopaLabs.logo/NopaLabs_Logo-01.png)
