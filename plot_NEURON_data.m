t = load('time_trace_flash.dat');
t = t/1000;
vm = load('vm_trace_flash-noI_F.dat');

ind = find(t==0); ind(end+1) = length(t) + 1;

figure
for i = 1:length(ind)-1
    sel = ind(i):ind(i+1)-1;
    subplot(4,11,i)
    plot(t(sel), vm(sel))
    xlim([t(sel(1))-0.05, t(sel(end))+0.05])
    ylim([-70, -45])
end

subplot(4,11,39)
xlabel('Time (s)')

subplot(4,11,12)
ylabel('Vm (mV)')

%%
t_moving = load('time_trace_moving.dat');
t_moving = t_moving/1000;
vmPD = load('vm_trace_PD-noI_F-sameInpt_F.dat');
vmND = load('vm_trace_ND-noI_F-sameInpt_F.dat');

ind = find(t_moving==0); ind(end+1) = length(t_moving) + 1;
figure
for i = 1:length(ind)-1
    sel = ind(i):ind(i+1)-1;
    subplot(4,1,i)
    plot(t_moving(sel), vmPD(sel),'r')
    hold on
    plot(t_moving(sel), vmND(sel),'b')
    xlim([0, 2.5])
    ylim([-75, -40])
end
xlabel('Time (s)')
subplot(4,1,1)
ylabel('Vm (mV)')