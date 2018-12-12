%medium line transmission - 3 ph star connect
%T and Pi models
z = 0.05 + 0.45j;    %per phase series impedance per km
y = 1j*(3.4e-6);     %per phase shunt impedance per km
d = 80;              %distance in km
Z = d*z;             %per phase series impedance (in ohms)
Y = d*y;             %per phase shunt impedance (in siemens)

A1 = 1+(Y*Z)/2;       %T-model ABCD
B1 = Z+(Y*Z*Z)/4;
C1 = Y;
D1 = 1+(Y*Z)/2;

A2 = 1+(Y*Z)/2;       %Pi-model ABCD
B2 = Z;
C2 = Y+(Z*Y*Y)/4;
D2 = 1+(Y*Z)/2;

%all values taken are RMS
%recieving- 200MVA 0.8 lag pf at 220KV(rms)

Sr = 200*(0.8-0.6j)*1000000;         %total power recieved (200MVA 0.8 lag)
Srp = Sr/3;                          %per phase power recieved

Vrl = 220000;                        %recieving end line voltage
Vrp = Vrl/1.732;                     %recieving end phase voltage

Ir = conj(Srp/Vrp);                        %recieving end current

%T-model results
Vsp = A1*Vrp + B1*Ir;                %sending end per phase voltage
Is = C1*Vrp + D1*Ir;                 %sending end current
Vsl = 1.732*Vsp;                     %sending end line voltage

Ssp = Vsp*conj(Is);          %per phase power at sending end
Ss = 3*Ssp;            %total power at sending end

mag_Vsl = abs(Vsl);
ang_Vsl = (180/3.14)*angle(Vsl);

mag_Vsp = abs(Vsp);
ang_Vsp = (180/3.14)*angle(Vsp);

mag_Vrl = abs(Vrl);
ang_Vrl = (180/3.14)*angle(Vrl);

mag_Vrp = abs(Vrp);
ang_Vrp = (180/3.14)*angle(Vrp);

mag_Ss = abs(Ss);
ang_Ss = (180/3.14)*angle(Ss);

mag_Sr = abs(Sr);
ang_Sr = (180/3.14)*angle(Sr);

reg = 100*(Vsl-Vrl)/Vsl;      %voltage regulation

trans_eff = 100*mag_Sr/mag_Ss;   %transmission efficiency

fprintf('*recieving- 200MVA 0.8 lag pf at 220KV(rms)\n');
fprintf('T-model results-\n');
fprintf('Sending end line voltage Vsl = %d (%d)\n', mag_Vsl, ang_Vsl);
fprintf('Sending end phase voltage Vsp = %d (%d)\n', mag_Vsp, ang_Vsp);
fprintf('Receving end line voltage Vrl = %d (%d)\n', mag_Vrl, ang_Vrl);
fprintf('Receving end phase voltage Vrp = %d (%d)\n', mag_Vrp, ang_Vrp);
fprintf('Sending end power = %d (%d)\n', mag_Ss, ang_Ss);
fprintf('Receving end power = %d (%d)\n', mag_Sr, ang_Sr);
fprintf('Voltage regulation = %d percent \n',reg);
fprintf('Transmission efficiency = %d percent \n',trans_eff);

%Pi-model results
Vsp = A2*Vrp + B2*Ir;                %sending end per phase voltage
Is = C2*Vrp + D2*Ir;                 %sending end current
Vsl = 1.732*Vsp;                      %sending end line voltage

Ssp = Vsp*conj(Is);          %per phase power at sending end
Ss = 3*Ssp;            %total power at sending end

mag_Vsl = abs(Vsl);
ang_Vsl = (180/3.14)*angle(Vsl);

mag_Vsp = abs(Vsp);
ang_Vsp = (180/3.14)*angle(Vsp);

mag_Vrl = abs(Vrl);
ang_Vrl = (180/3.14)*angle(Vrl);

mag_Vrp = abs(Vrp);
ang_Vrp = (180/3.14)*angle(Vrp);

mag_Ss = abs(Ss);
ang_Ss = (180/3.14)*angle(Ss);

mag_Sr = abs(Sr);
ang_Sr = (180/3.14)*angle(Sr);

reg = 100*(Vsl-Vrl)/Vsl;      %voltage regulation

trans_eff = 100*mag_Sr/mag_Ss;   %transmission efficiency

fprintf('\n');
fprintf('Pi-model results-\n');
fprintf('Sending end line voltage Vsl = %d (%d)\n', mag_Vsl, ang_Vsl);
fprintf('Sending end phase voltage Vsp = %d (%d)\n', mag_Vsp, ang_Vsp);
fprintf('Receving end line voltage Vrl = %d (%d)\n', mag_Vrl, ang_Vrl);
fprintf('Receving end phase voltage Vrp = %d (%d)\n', mag_Vrp, ang_Vrp);
fprintf('Sending end power = %d (%d)\n', mag_Ss, ang_Ss);
fprintf('Receving end power = %d (%d)\n', mag_Sr, ang_Sr);
fprintf('Voltage regulation = %d percent \n',reg);
fprintf('Transmission efficiency = %d percent \n\n',trans_eff);

%recieving- 360MVA unity pf at 220KV(rms)

Sr = 360*1000000;         %total power recieved (360MVA unity pf)
Srp = Sr/3;                          %per phase power recieved

Vrl = 220000;                        %recieving end line voltage
Vrp = Vrl/1.732;                     %recieving end phase voltage

Ir = conj(Srp/Vrp);                        %recieving end current

%T-model results
Vsp = A1*Vrp + B1*Ir;                %sending end per phase voltage
Is = C1*Vrp + D1*Ir;                 %sending end current
Vsl = 1.732*Vsp;                      %sending end line voltage

Ssp = Vsp*conj(Is);          %per phase power at sending end
Ss = 3*Ssp;            %total power at sending end

mag_Vsl = abs(Vsl);
ang_Vsl = (180/3.14)*angle(Vsl);

mag_Vsp = abs(Vsp);
ang_Vsp = (180/3.14)*angle(Vsp);

mag_Vrl = abs(Vrl);
ang_Vrl = (180/3.14)*angle(Vrl);

mag_Vrp = abs(Vrp);
ang_Vrp = (180/3.14)*angle(Vrp);

mag_Ss = abs(Ss);
ang_Ss = (180/3.14)*angle(Ss);

mag_Sr = abs(Sr);
ang_Sr = (180/3.14)*angle(Sr);

reg = 100*(Vsl-Vrl)/Vsl;      %voltage regulation

trans_eff = 100*mag_Sr/mag_Ss;   %transmission efficiency

fprintf('*recieving- 360MVA unity pf at 220KV(rms)\n');
fprintf('T-model results-\n');
fprintf('Sending end line voltage Vsl = %d (%d)\n', mag_Vsl, ang_Vsl);
fprintf('Sending end phase voltage Vsp = %d (%d)\n', mag_Vsp, ang_Vsp);
fprintf('Receving end line voltage Vrl = %d (%d)\n', mag_Vrl, ang_Vrl);
fprintf('Receving end phase voltage Vrp = %d (%d)\n', mag_Vrp, ang_Vrp);
fprintf('Sending end power = %d (%d)\n', mag_Ss, ang_Ss);
fprintf('Receving end power = %d (%d)\n', mag_Sr, ang_Sr);
fprintf('Voltage regulation = %d percent \n',reg);
fprintf('Transmission efficiency = %d percent \n',trans_eff);

%Pi-model results
Vsp = A2*Vrp + B2*Ir;                %sending end per phase voltage
Is = C2*Vrp + D2*Ir;                 %sending end current
Vsl = 1.732*Vsp;                      %sending end line voltage

Ssp = Vsp*conj(Is);          %per phase power at sending end
Ss = 3*Ssp;            %total power at sending end

mag_Vsl = abs(Vsl);
ang_Vsl = (180/3.14)*angle(Vsl);

mag_Vsp = abs(Vsp);
ang_Vsp = (180/3.14)*angle(Vsp);

mag_Vrl = abs(Vrl);
ang_Vrl = (180/3.14)*angle(Vrl);

mag_Vrp = abs(Vrp);
ang_Vrp = (180/3.14)*angle(Vrp);

mag_Ss = abs(Ss);
ang_Ss = (180/3.14)*angle(Ss);

mag_Sr = abs(Sr);
ang_Sr = (180/3.14)*angle(Sr);

reg = 100*(Vsl-Vrl)/Vsl;      %voltage regulation

trans_eff = 100*mag_Sr/mag_Ss;   %transmission efficiency

fprintf('\n');
fprintf('Pi-model results-\n');
fprintf('Sending end line voltage Vsl = %d (%d)\n', mag_Vsl, ang_Vsl);
fprintf('Sending end phase voltage Vsp = %d (%d)\n', mag_Vsp, ang_Vsp);
fprintf('Receving end line voltage Vrl = %d (%d)\n', mag_Vrl, ang_Vrl);
fprintf('Receving end phase voltage Vrp = %d (%d)\n', mag_Vrp, ang_Vrp);
fprintf('Sending end power = %d (%d)\n', mag_Ss, ang_Ss);
fprintf('Receving end power = %d (%d)\n', mag_Sr, ang_Sr);
fprintf('Voltage regulation = %d percent \n',reg);
fprintf('Transmission efficiency = %d percent \n\n',trans_eff);