% 180.604, Spring 2023
% HA5 II
% IRF in NK model
% Qingyuan Fang, 03/2023

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

% close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------
% 14 endogenous var 
var y           ${y}$                   (long_name='output-y_steady')
    y_nat       ${y^{nat}}$             (long_name='natural output-y_steady')
    y_gap       ${\tilde y}$            (long_name='output gapk=y-y_nat')
    pi          ${\pi}$                 (long_name='inflation annualized')
    p           ${p}$                   (long_name='price level')
    i           ${i}$                   (long_name='i-\rho annualized')
    r           ${r}$                   (long_name='r-\rho annualized')
    r_nat       ${r^{nat}}$             (long_name='r_nat-\rho annualized')
    m           ${m}$                   (long_name='money supply')
    n           ${n}$                   (long_name='employment')
    w           ${w}$                   (long_name='real wage')
    nu          ${\nu}$                 (long_name='AR(1) monetary policy shock process')
    a           ${a}$                   (long_name='AR(1) technology shock process')
    z           ${z}$                   (long_name='AR(1) preference shock process')  
;

% 3 exogenous var/shocks
varexo  eps_nu      ${\varepsilon_\nu}$     (long_name='monetary policy shock')
        eps_a       ${\varepsilon_a}$       (long_name='technology shock')
        eps_z       ${\varepsilon_z}$       (long_name='discount rate shock')
       ;

parameters alppha       ${\alpha}$      (long_name='capital share')
    betta               ${\beta}$       (long_name='discount factor')
    rho_a               ${\rho_a}$      (long_name='autocorrelation technology shock')
    rho_nu              ${\rho_{\nu}}$  (long_name='autocorrelation monetary policy shock')
    rho_z               ${\rho_{z}}$    (long_name='autocorrelation monetary demand shock')
    siggma              ${\sigma}$      (long_name='inverse EIS')
    varphi              ${\varphi}$     (long_name='inverse Frisch elasticity')
    phi_pi              ${\phi_{\pi}}$  (long_name='inflation feedback Taylor Rule')
    phi_y               ${\phi_{y}}$    (long_name='output feedback Taylor Rule')
    eta                 ${\eta}$        (long_name='semi-elasticity of money demand')
    epsilon             ${\epsilon}$    (long_name='demand elasticity')
    theta               ${\theta}$      (long_name='Calvo parameter')
    ;

%----------------------------------------------------------------
% 2. Calibration (Gali, p67-72)
%----------------------------------------------------------------
siggma = 1;
varphi = 5;
phi_pi = 1.5;
phi_y  = 0.125;
theta = 1/100;
rho_nu =0.5;
rho_z  = 0.5;
rho_a  = 0.9;
betta  = 0.99;
eta  = 3.77; %footnote 11, p. 115
alppha = 1/4; %in the lecture note, alppha = 0
epsilon = 9;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model(linear);
//Composite parameters
#Theta=(1-alppha)/(1-alppha+alppha*epsilon);                       %page 60
#lambda=(1-theta)*(1-betta*theta)/theta*Theta;                     %page 61
#kappa=lambda*(siggma+(varphi+alppha)/(1-alppha));                 %page 63
#psi_ya=(1+varphi)/(siggma*(1-alppha)+varphi+alppha);              %page 62                                                


[name='NKPC eq. (22)']
pi/4=betta*pi(+1)/4+kappa*y_gap;

[name='IS eq. (23)']
y_gap=-1/siggma*(i-pi(+1)-r_nat)/4+y_gap(+1);

[name='Interest Rate Rule eq. (26)']
i/4= phi_pi*pi/4+phi_y*(y - steady_state(y))+nu;

[name='Definition: natural rate of interest, eq. (24)']
r_nat/4=-siggma*psi_ya*(1-rho_a)*a+(1-rho_z)*z;

[name='Definition: natural output, eq. (20)']
y_nat=psi_ya*a;

y_gap = y - y_nat;

[name='Definition: inflation']
pi/4=p-p(-1);

[name='Fisher equality']
r = i - pi;

[name='Production function, eq. (14)']
y=a+(1-alppha)*n;

[name='FOC labor, eq. (2)']
w=siggma*y+varphi*n;

[name = 'Money supply, eq. (4)']
m - p = y - eta*i/4;

[name='Monetary policy shock, p. 64']
nu=rho_nu*nu(-1)+eps_nu;

[name='TFP shock, eq. (6)']
a=rho_a*a(-1)+eps_a;

[name='Preference shock, p. 54']
z=rho_z*z(-1) + eps_z;
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
  nu = 0;
  a = 0;
  z = 0;
  eps_nu = 0; 
  eps_a = 0;
  eps_z = 0;
end;

shocks;
    var eps_nu = 0.0025^2; //1 standard deviation monetary shock of 25 basis points, i.e. 1 percentage point annualized
    %var eps_nu = 0.01^2; 
end;

steady;

% first order Taylor expension
stoch_simul(hp_filter = 1600, order = 1, irf = 16, nograph);
