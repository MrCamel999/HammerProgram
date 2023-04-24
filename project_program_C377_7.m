
% Predict using polynomial models the desired, raised height (h) that the
% hammer is raised in order to reach a desired distance (d)

% Team: C377-7

clear; clc;

%% Initialize Knowns

% Note: Not the actual polynomial that we're using for the game day. This
% is a substitute made of simulated test values that we made up. The actual
% data will be collected between now and game day
p1 = 1.0925;
p2 = 9.7869;
polymodel1 = [p1, p2];

n = 1;


%% Rounds 1 - 3
while n < 4
    % print 'Round Title'
    fprintf("\nRound %d: Land Team Puck in Zone \n",n);

    % print zone options
    fprintf("Your zone options are: \n")
    fprintf("|     edge     |\n")
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
                coords = [-25 37.5];
                isValid = true;
                break
            case "1b"
                coords = [0 37.5];
                isValid = true; 
                break
            case "1c"
                coords = [25 37.5];
                isValid = true;
                break
            case "2a"
                coords = [-25 62.5];
                isValid = true;
                break
            case "2b"
                coords = [0 62.5];
                isValid = true;
                break
            case "2c"
                coords = [25 62.5];
                isValid = true;
                break
            case "3a"
                coords = [-25 87.5];
                isValid = true;
                break
            case "3b"
                coords = [0 87.5];
                isValid = true;
                break
            case "3c"
                coords = [25 87.5];
                isValid = true;
                break
            case "zone 4"
                coords = [0 112.5];
                isValid = true;
                break
            case "edge"
                coords = [0 125];
                break
            case "exit"
                return
            case "quit"
                return
            case "stop"
                return
            case "q"
                return
            otherwise
                warning("Invalid input, try again.\n");
        end
    end

    % perform calculations for initial height and firing angle
    distance = sqrt(coords(1)^2 + coords(2)^2);     % calc distance
    angle = atan2(coords(2), coords(1)) * (180/pi);
    h1hat = distance/p1;               % polyval
    fprintf("\nThe height at which you should raise the hammer is %.2f centimeters.\n", h1hat);
    fprintf("The angle at which you should aim the hammer is %.2f degrees.\n", angle);
    n = n + 1;
end

%% Round 4
fprintf("\nRound 4: Hit Team Puck into EF Puck\n");

p3 = 1.0925;
p4 = 9.7869;
polymodel2 = [p3, p4];
isValidMass = false;
while ~isValidMass
    mass = input("\nEnter the mass of the EF Puck in grams (between 10 and 30 grams): ");
    if mass >= 10 && mass <= 30
        isValidMass = true;
    else
        warning("Invalid mass, please enter a value between 10 and 30 grams.");
    end
end
team_puck_coords = [0, 0];
ef_puck_coords = [0, 75];
distance = sqrt((ef_puck_coords(1) - team_puck_coords(1))^2 + (ef_puck_coords(2) - team_puck_coords(2))^2);
target_coords = [0, 112.5];
target_distance = target_coords(2) - ef_puck_coords(2);
h1hat = (distance * target_distance) / (p3 * mass);
angle = atan2(target_coords(2), target_coords(1)) * (180/pi);
fprintf("\nThe height at which you should raise the hammer is %.2f centimeters.\n", h1hat);
fprintf("The angle at which you should aim the hammer is %.2f degrees.\n", angle);
n = n + 1;

%% Scoring points at the end

xInput = input("\nEnter the approximate x coordinate of the middle of the goal (middle is 0): ");

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
                coords = [-25 37.5];
                isValid = true;
                break
            case "1b"
                coords = [0 37.5];
                isValid = true; 
                break
            case "1c"
                coords = [25 37.5];
                isValid = true;
                break
            case "2a"
                coords = [-25 62.5];
                isValid = true;
                break
            case "2b"
                coords = [0 62.5];
                isValid = true;
                break
            case "2c"
                coords = [25 62.5];
                isValid = true;
                break
            case "3a"
                coords = [-25 87.5];
                isValid = true;
                break
            case "3b"
                coords = [0 87.5];
                isValid = true;
                break
            case "3c"
                coords = [25 87.5];
                isValid = true;
                break
            case "zone 4"
                coords = [0 112.5];
                isValid = true;
                break
            case "goal"
                coords = [xInput 137.5];
                isValid = true;
                break
            case "edge"
                coords = [0 125];
                break
            case "exit"
                return
            case "quit"
                return
            case "stop"
                return
            case "q"
                return
            otherwise
                warning("Invalid input, try again.\n");
        end
    end
    distance = sqrt(coords(1)^2 + coords(2)^2);     % calc distance
    angle = atan2(coords(2), coords(1)) * (180/pi);
    h1hat = distance/p1;               % polyval
    fprintf("\nThe height at which you should raise the hammer is %.2f centimeters.\n", h1hat);
    fprintf("The angle at which you should aim the hammer is %.2f degrees.\n", angle);
    n = n + 1;
end