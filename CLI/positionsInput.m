function [positions] = positionsInput(size)
    positions = [];
    for i=1:size
        fprintf('Inserisci la coordinata X del punto %d:', i);
        x = input(' ');
        fprintf('Inserisci la coordinata Y del punto %d:', i);
        y = input(' ');
        fprintf('Inserisci la coordinata Z del punto %d:', i);
        z = input(' ');
        p = [x y z];
        positions = [positions; p];
    end
end