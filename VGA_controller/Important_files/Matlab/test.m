%%
loop = 10;

AngFlo = zeros(255,255);
AngFxp = zeros(255,255);
HypoFlo = zeros(255,255);
HypoFxp = zeros(255,255);
for ii = 1 : 255
    ii
    for jj = 1 : 255
        [AngFlo(ii,jj) HypoFlo(ii,jj)] = cordic_float(ii,jj,loop);
        [AngFxp(ii,jj) HypoFxp(ii,jj)] = cordic_fxp(ii,jj,loop);
    end
end

AngleDiff = AngFlo - AngFxp;
HypoDiff = HypoFlo - HypoFxp;
save('results','AngFlo','AngFxp','AngleDiff','HypoFlo','HypoFxp','HypoDiff')