%short line transmission - 3 ph star connect
z = 0.125 + 0.4375j;    %impedance per phase per km
d = 16;                 %distance of kms
Z = d*z;                %total impedance per phase for 16 km

A = 1;                  %short-line ABCD
B = Z;
C = 0;
D = 1;

%all values taken are RMS
%recieving- 70MVA 0.8 lag pf at 64KV(rms)
Vrl = 64000;             %recieving end line voltage
Vrp = Vrl/1.732;         %recieving end phase voltage

Sr = 70*(0.8 - 0.6j)*1000000;  %total power recieved (70 MVA 0.8 lag)
Srp = Sr/3;                %per phase power at recieving end

Ir = conj(Srp/Vrp);             %recieving end phase current

Vsp = A*Vrp + B*Ir;        %sending end phase voltage
Is = C*Vrp + D*Ir;                 %sending end phase current

Vsl = Vsp*1.732;         %sending end line voltage
reg = 100*(Vsl-Vrl)/Vsl;      %voltage regulation

Ssp = Vsp*conj(Is);          %per phase power at sending end
Ss = 3*Ssp;              %total power at sending end

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

load = Vrp/Ir;          %recieving end impedance
mag_load = abs(load);
ang_load = (180/3.14)*angle(load);

trans_eff = 100*mag_Sr/mag_Ss;   %transmission efficiency

fprintf('recieving- 70MVA 0.8 lag pf at 64KV(rms)\n');
fprintf('Sending end line voltage Vsl = %d (%d)\n', mag_Vsl, ang_Vsl);
fprintf('Sending end phase voltage Vsp = %d (%d)\n', mag_Vsp, ang_Vsp);
fprintf('Receving end line voltage Vrl = %d (%d)\n', mag_Vrl, ang_Vrl);
fprintf('Receving end phase voltage Vrp = %d (%d)\n', mag_Vrp, ang_Vrp);
fprintf('Receving end per phase load = %d (%d)\n', mag_load, ang_load);
fprintf('Sending end power = %d (%d)\n', mag_Ss, ang_Ss);
fprintf('Receving end power = %d (%d)\n', mag_Sr, ang_Sr);
fprintf('Voltage regulation = %d percent \n',reg);
fprintf('Transmission efficiency = %d percent \n',trans_eff);