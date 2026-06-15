function [Driver_name] = Errorcheck_Driver(Driver_name,String_Conversion)

%[Driver_name] = Errorcheck_Driver(Driver_name)

%   This allows the error checks the user input for the driver name

%By Barakkah

while isempty(Driver_name) || isnan(str2double(Driver_name)) == 0 || sum(strcmpi(Driver_name,String_Conversion)) == 0 %<SM:WHILE:IBISHOMI>
    Driver_name = input('Error. Enter a name from the table above.\n ','s');
end