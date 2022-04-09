clear
clc
close all

%Variables Needed
positions = [];
rotations = [];
times = [];
points = 0;

temporal_step = 0.1;

while true
    disp("+++++++++  Menu Principale  ++++++++++");
    disp("+                                    +");
    disp("+     1. Inserisci le posizioni      +");
    disp("+     2. Inserisci le rotazioni      +");
    disp("+  3. Indica i tempi di percorrenza  +");
    disp("+    4. Pianifica la Traiettoria     +");
    disp("+                                    +");
    disp("+              0. Esci               +");
    disp("++++++++++++++++++++++++++++++++++++++");
    scelta =  input('Fai la tua scelta: ');
    while scelta > 4 || scelta < 0
        scelta = input('Fai una scelta corretta: ');
    end
    close all;
    if scelta == 0
        disp("App sviluppata da Nicolas Calzone e Giuseppe Ciro Riccardi");
        disp("Arrivederci");
        break;
    end
    if scelta == 1  
        if(points==0)
            points = input('Quanti punti vuoi considerare? ');
        end
        positions = positionsInput(points);
    end
    if scelta == 2
        if(points==0)
            points = input('Quanti punti vuoi considerare? ');
        end
        count=1;
        while(count <= points)
            fprintf('<strong>Matrice di Rotazione %d</strong>\n', count);
            R = rotationMatrixInput();
            if(uint8(R'*R) ~= eye(3))
                disp('La matrice in input non è una matrice di rotazione valida');
            else
                disp('Matrice di rotazione valida');
                rotations = [rotations; R];
                count = count + 1;
            end
        end
    end
    if scelta == 3
        if(points==0)
            points = input('Quanti punti vuoi considerare? ');
        end
        times = timesInput(points);
        disp(times)
    end
    if scelta == 4
        %TRAIETTORIA POSIZIONE
        pe = trajectory_planning_position(positions, times, temporal_step);
        %GRAFICO TRAIETTORIA DI POSIZIONE
        fig1 = figure('Name','Traiettoria di Posizione');
        grid on;
        title('Traiettoria di Posizione');
        xlabel('Asse X');
        ylabel('Asse Y');
        zlabel('Asse Z');
        hold on;
        set(gca, 'XLim', [0 6], 'YLim', [0 6], 'ZLim', [0 6]);
        curve = animatedline('Color', 'b');
        for i=1:size(pe,1)
            view(3);
            addpoints(curve, pe(i,1), pe(i,2), pe(i,3));
            drawnow;
        end
        for i=1:size(positions,1)
            scatter3(positions(i,1),positions(i,2),positions(i,3), 'red', 'filled');
        end
        hold off;
        legend('Traiettoria', 'Punti Inseriti','Location','NorthWest');
        %TRAIETTORIA ROTAZIONE
        [theta_vector, re, axis_plot, theta_plot] = trajectory_planning_rotation(rotations, times, temporal_step);
        %GRAFICO TRAIETTORIA DI ROTAZIONE
        fig2 = figure('Name', 'Traiettoria di Rotazione');
        title('Traiettoria di Rotazione');
        set(gca, 'XLim', [0 6], 'YLim', [0 6], 'ZLim', [0 6]);
        xlabel('Asse X');
        ylabel('Asse Y');
        zlabel('Asse Z');
        view(3)
        grid on
        hold on
        for i=1:size(positions,1)
            scatter3(positions(i,1),positions(i,2),positions(i,3), 'red', 'filled');
            text(positions(i,1),positions(i,2),positions(i,3), ['Angolo ', num2str(i), ': ', num2str(theta_plot(i))], ...
          'HorizontalAlignment', 'left', ...
          'VerticalAlignment', 'top');
        end
        for i=1:size(re,1)
            q = quiver3(pe(i,1), pe(i,2), pe(i,3), re(i,1),re(i,2),re(i,3),'Color','#80bfff');
            set(q,'AutoScale','on', 'AutoScaleFactor', 2)
        end
        legend('Punti Inseriti','Location','NorthWest');
    end
end