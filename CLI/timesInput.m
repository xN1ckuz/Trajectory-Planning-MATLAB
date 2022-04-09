function [times] = timesInput(size)
    times(1)=0;
    for i=2:size
        fprintf('Inserisci la durata (in secondi) del tratto %d:',i-1);
        time = input(' ');
        times = [times, (times(i-1)+time)];
    end
end