% Tema: Regiones de estabilidad Convertidor CD-CD considerando resitencias
% parásitas
% Fecha: 19 de Noviembre 2025
% Autores: Julián Hern+andez-Gallardo y Erick Moreno-Negrete
clc
clearvars
close all
%% Datos
Transfer_Functions_Boost_STM32
%% Vectores
%sm=sigmaMaximo(a,b,c,d);
sm=961.016721522009;
%Sig = [0 300 700 1100 1400]';
Sig =0;
% Sig = linspace(0,1490,5)';
ns = length(Sig); 
%% Frecuencias de cruce
w0 = [];
x0 = 1e-1;
nw = 1000;
for i=1:ns
    s = Sig(i);
    if i==1
        ki  = @(w) ((w.^2+s.^2).*(d*(a-2*s)+c*(-b+w.^2+s.^2)))./(c.^2.*w.^2+(d-c.*s).^2);
        w0a = fzero(@(w) ki(w), x0);
    else
        kir = @(kpr) (b*s+d*kpr.*s-a*s.^2-c*kpr.*s.^2+s.^3)./(d-c.*s);
        kp  = @(w) (-b*d+d*w.^2+2*a*d*s+2*c*w.^2.*s-3*d*s.^2+2*c*s.^3-a*c*(w.^2+s.^2))./(c.^2.*w.^2+(d-c.*s).^2);
        ki  = @(w) ((w.^2+s.^2).*(d*(a-2*s)+c*(-b+w.^2+s.^2)))./(c.^2.*w.^2+(d-c.*s).^2);
        w0a = fzero(@(w) kir(kp(w))-ki(w), w0a);
    end
    w0 = [w0,w0a];
end
%% Figuras
figure(1);
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(gca,'GridLineStyle','--')
hold on
aT = 0.5; % transparencia
win = 0.00001;
Color = [0 180 216;...
          0 150 199;...
          0 119,182;...
          2 62 138;...
          3 4 94]/255;
for i = 1:ns
    w = 0.0001:(w0(i)-win)/(nw-1):w0(i);
    s = Sig(i);
    % Curvas y rectas
    kpv=(-b*d+2*a*d*s-a*c*s.^2-3*d*s.^2+2*c*s.^3)./(d-c*s).^2;
    kiv=(s.^2.*(d*(a-2*s)+c*(-b+s)))./(d-c*s).^2;
    kp=(-b*d+d*w.^2+2*a*d*s+2*c*w.^2.*s-3*d*s.^2+2*c*s.^3-a*c*(w.^2+s.^2))./(c.^2.*w.^2+(d-c.*s).^2);
    ki=((w.^2+s.^2).*(d*(a-2*s)+c*(-b+w.^2+s.^2)))./(c.^2.*w.^2+(d-c.*s).^2);
    kpf=(-b*d+d*w0(i).^2+2*a*d*s+2*c*w0(i).^2.*s-3*d*s.^2+2*c*s.^3-a*c*(w0(i).^2+s.^2))./(c.^2.*w0(i).^2+(d-c.*s).^2);
    kif=((w0(i).^2+s.^2).*(d*(a-2*s)+c*(-b+w0(i).^2+s.^2)))./(c.^2.*w0(i).^2+(d-c.*s).^2);
    kp=[kpv kp];
    ki=[kiv ki];
    kpr=[kpv kpf];
    kir=[kiv kif];
    % Grafica 2D
    figure(1)
    box on
    vColor = [255, 204, 0]/255;
    plot(kp,ki,'k','LineWidth',0.5)
    plot(kpr,kir,'k','LineWidth',0.5)
    x2 = [kp, [kpf kpv]];
    inBetween = [ki, [kif kiv]];
    hh = fill(x2, inBetween,Color(i,:),'HandleVisibility','off');
    set(hh, 'facealpha', aT)
end
figure(1);
xlabel('$k_p(\omega,\sigma)$','Interpreter','Latex','FontSize', 16)
ylabel('$k_i(\omega,\sigma)$','Interpreter','Latex','FontSize', 16)
s=sm;
kpv=(-b*d+2*a*d*s-a*c*s.^2-3*d*s.^2+2*c*s.^3)./(d-c*s).^2;
kiv=(s.^2.*(d*(a-2*s)+c*(-b+s)))./(d-c*s).^2;
legText = cell(length(Sig)-1,1);
for i = 1:length(Sig)-1
    legText{i} = sprintf('\\sigma \\in [%.2f, %.2f]', Sig(i), Sig(i+1));
end
legend(legText,'Interpreter','latex','Location','best','FontSize', 12)
plot(kpv,kiv,'rp','MarkerFaceColor',[1 0 0],'MarkerSize',8,'DisplayName', '$\sigma_m \approx 1491$')
xline(0,'k--','HandleVisibility','off')

function sm=sigmaMaximo(a,b,c,d)
    Sigma1=@(a,b,c,d) (c.*d-(c.^3.*d.*(b.*c.^2-a.*c.*d+d.^2)).^(1/3))./c.^2;
    Sigma2=@(a,b,c,d) (2.*c.*d+(1-1i*sqrt(3)).*(c.^3.*d.*(b.*c.^2+d.*(-a.*c+d))).^(1/3))./(2.*c.^2);
    Sigma3=@(a,b,c,d) (2.*c.*d+(1+1i*sqrt(3)).*(c.^3.*d.*(b.*c.^2+d.*(-a.*c+d))).^(1/3))./(2.*c.^2);
    s1=Sigma1(a,b,c,d);
    s2=Sigma2(a,b,c,d);
    s3=Sigma3(a,b,c,d);
    tol=1e-11; % Tolerancia para considerar "real"
    if abs(imag(s1)) < tol
       sm = real(s1);
    elseif abs(imag(s2)) < tol
       sm = real(s2);
    elseif abs(imag(s3)) < tol
       sm = real(s3);
    else
       error('Ninguno de los tres valores es real dentro de la tolerancia.');
    end   
end



