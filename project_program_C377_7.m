% Predict using polynomial models the desired, raised height (h) that the
% hammer is raised in order to reach a desired distance (d)

% Team: C377-7

clear; clc;

%% Initialize Knowns

% Note: This is simply left in for the convenience of not having to retype
% it everytime i need to read the test data. It'll be removed when the
% code needs to be submitted.
%
% data = readtable("project_test_data.csv");
% polymodel = polyfit(data.distance, data.height, 2);


% Note: Not the actual polynomial that we're using for the game day. This
% is a substitute made of simulated test values that we made up. The actual
% data will be collected between now and game day
p1 = 0.0129;
p2 = 0.4638;
p3 = -5.2312;
polymodel = [p1, p2, p3];

n = 1;


%% Rounds 1 - 3
while n < 4
    % print 'Round Title'
    fprintf("\nRound %d: Land Team Puck in Zone \n",n);

    % print zone options
    fprintf("Your zone options are: \n")
    fprintf("|    zone 4    |\n")
    fprintf("| 3a | 3b | 3c |\n")
    fprintf("| 2a | 2b | 2c |\n")
    fprintf("| 1a | 1b | 1c |\n")
    
    isValid = false;
    while isValid == false

        prompt = "\nEnter the zone you want to target: ";
        zone = input(prompt, 's');       % change this to be the zone name

        % switch case for different zones, coordinates are placeholder
        % values for now
        switch zone
            case "1a"
                coords = [12.5 62.5];
                isValid = true;
                break
            case "1b"
                coords = [37.5 62.5];
                isValid = true;
                break
            case "1c"
                coords = [62.5 62.5];
                isValid = true;
                break
            case "2a"
                coords = [12.5 87.5];
                isValid = true;
                break
            case "2b"
                coords = [37.5 87.5];
                isValid = true;
                break
            case "2c"
                coords = [62.5 87.5];
                isValid = true;
                break
            case "3a"
                coords = [12.5 112,5];
                isValid = true;
                break
            case "3b"
                coords = [37.5 112.5];
                isValid = true;
                break
            case "3c"
                coords = [62.5 112.5];
                isValid = true;
                break
            case "zone 4"
                coords = [37.5 137.5];
                isValid = true;
                break
            case "exit"
                return
            case "quit"
                return
            case "stop"
                return
            otherwise
                warning("Invalid input, try again.\n");
        end
    end

    % perform calculations for initial height and firing angle
    distance = sqrt(coords(1)^2 + coords(2)^2);     % calc distance
    angle = atan2(coords(2), coords(1)) * (180/pi);
    d1hat = polyval(polymodel, distance);               % polyval
    fprintf("\nThe height at which you should raise the hammer is %.2f centimeters.\n", d1hat);
    fprintf("The angle at which you should aim the hammer is %.2f degrees.\n", angle);
    n = n + 1;
end

%% Round 4
fprintf("\nRound 4: Land Team Puck\n");

n = n + 1;


%% Scoring points at the end

while true
    fprintf("\nRound %d: Land Team Puck in Zone\n",n);

    isValid = false;
    while isValid == false

        prompt = "\nEnter the zone you want to target: ";
        zone = input(prompt, 's');       % change this to be the zone name

        % switch case for different zones, coordinates are placeholder
        % values for now
        switch zone
            case "1a"
                coords = [12.5 62.5];
                isValid = true;
                break
            case "1b"
                coords = [37.5 62.5];
                isValid = true;
                break
            case "1c"
                coords = [62.5 62.5];
                isValid = true;
                break
            case "2a"
                coords = [12.5 87.5];
                isValid = true;
                break
            case "2b"
                coords = [37.5 87.5];
                isValid = true;
                break
            case "2c"
                coords = [62.5 87.5];
                isValid = true;
                break
            case "3a"
                coords = [12.5 112,5];
                isValid = true;
                break
            case "3b"
                coords = [37.5 112.5];
                isValid = true;
                break
            case "3c"
                coords = [62.5 112.5];
                isValid = true;
                break
            case "zone 4"
                coords = [37.5 137.5];
                isValid = true;
                break
            case "exit"
                return
            case "quit"
                return
            case "stop"
                return
            otherwise
                warning("Invalid input, try again.\n");
        end
    end
    distance = sqrt(coords(1)^2 + coords(2)^2);     % calc distance
    angle = atan2(coords(2), coords(1)) * (180/pi);
    d1hat = polyval(polymodel, distance);               % polyval
    fprintf("\nThe height at which you should raise the hammer is %.2f centimeters.\n", d1hat);
    fprintf("The angle at which you should aim the hammer is %.2f degrees.\n", angle);
    n = n + 1;
end