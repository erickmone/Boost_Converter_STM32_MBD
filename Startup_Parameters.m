% ----- Script for the STM32 Initial Conditions

% Duty Cycle in percentage
Duty = 10;

% Clock Frequency
Fclk   = 170e6;

% Desired STM32 PWM frequency
Dpwm   = 500e3;

% Counter Period (AutoReload Register) (16 bits value)
ARR    = (Fclk/Dpwm) - 1;

% Prescaler (16 bits value)
PSC    = 0;

% STM32 PWM frequency
Fpwm   = Fclk/((ARR+1)*(PSC+1));

% STM32 PWM time period
PWMper = 1/Fpwm;

% STM32 LED frequency
TsLED   = 0.05;

Ts = 1e-5;
Tpre = 2.5;
Npre   = round(Tpre/Ts);
D_pre  = 0.10;

V_Sense_Gain = (220+10)/10;

Kp = 0.02;
Ki = 40;

alpha = 0.5;

K1 = Kp + alpha*Ts*Ki;
K2 = Ts*Ki;