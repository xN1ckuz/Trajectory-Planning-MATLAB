function [R] = rotationMatrixInput()
    R = [];
    for row=1:3
        for col=1:3
            fprintf('Inserisci il valore della riga %d colonna %d: ',row,col);
            R(row,col)=input('');
        end
    end
end