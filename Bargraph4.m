function [Lastbargraph] = Bargraph4(teamdriver_colour)
%  [Lastbargraph] = Bargraph4(teamdriver_colour)
%   This code helps to detremine the colour of the bargrapf depending on
%   the team
if strcmpi(teamdriver_colour, 'Mercedes')
       
    Lastbargraph = 'k'; 

elseif strcmpi(teamdriver_colour, 'Red Bull')

    Lastbargraph = 'b'; 

elseif strcmpi(teamdriver_colour, 'Ferrari')

    Lastbargraph = 'r'; 

elseif strcmpi(teamdriver_colour, 'McLaren')

    Lastbargraph = [1, 0.5, 0]; 

elseif strcmpi(teamdriver_colour, 'Aston Martin')

    Lastbargraph = 'g';

elseif strcmpi(teamdriver_colour, 'Alpine')

    Lastbargraph = [1, 0, 1];

elseif strcmpi(teamdriver_colour, 'Williams')

    Lastbargraph = [0.678, 0.847, 0.902];

elseif strcmpi(teamdriver_colour, 'Haas')

    Lastbargraph = [0.8, 0.8, 0.8];

elseif strcmpi(teamdriver_colour, 'AlphaTauri')

    Lastbargraph = [0.1, 0.2, 0.5];

elseif strcmpi(teamdriver_colour, 'Alfa Romeo')

    Lastbargraph = [0.6, 0, 0];
 end
end