clear all;
clc;

% Prompt for user input:
MMM = input('Please enter the month as MMM (e.g. JAN): ','s');
DD = input('Please enter the day as DD (e.g. 01): ','s');
YYYY = input('Please enter the year as YYYY (e.g. 2000): ','s');



%% Day

[day, flagDayConversion] = str2num(DD);

if length('DD') ~= 2
    error ('Day should be inputted as two digits. (e.g. 05)')
end

if flagDayConversion == 0
    error ('Day must be inputted as a number')
end


%% Year

% Check if the input is all numbers
[year, flagYearConversion] = str2num(YYYY);
if flagYearConversion == 0
    error('Incorrect year input. Year input must be a number')
end
% Check if the input consists of four digits
if length(YYYY) ~= 4
    error('Incorrect year input. Year input must be 4 digits')
end
% Check if the year is greater than or equal to 1900 or less than or
% equal to 9999
if  year < 1900
    error('Incorrect year input. Year input must be after 1900')
end


%% Month Conditions
switch MMM
    case 'JAN'
      month = 1;
      if day > 31
         error('This day does not exist.')
      end
    case 'FEB'
      month = 2;
        if   ((mod(year, 4)==0) && (mod(year,100)~=0) || (mod(year,400)==0))
            if day > 29
            error('This day does not exist.')
            end
        else
            if day > 28
         error('This day does not exist.')
            end
        end
    case 'MAR'
      month = 3;
      if day > 31
         error('This day does not exist.')
      end
    case 'APR'
      month = 4;
      if day > 30
         error('This day does not exist.')
      end
    case 'MAY'
      month = 5;
      if day > 31
         error('This day does not exist.')
      end
    case 'JUN'
      month = 6;
      if day > 30
         error('This day does not exist.')
      end
    case 'JUL'
      month = 7;
      if day > 31
         error('This day does not exist.')
      end
    case 'AUG'
      month = 8;
      if day > 31
         error('This day does not exist.')
      end
    case 'SEP'
      month = 9;
      if day > 30
         error('This day does not exist.')
      end
    case 'OCT'
      month = 10;
      if day > 31
         error('This day does not exist.')
      end
    case 'NOV'
      month = 11;
      if day > 30
         error('This day does not exist.')
      end
    case 'DEC'
      month = 12;
      if day > 31
         error('This day does not exist.')
      end
   
otherwise 
      error('Incorrect month input. Please enter the first 3 letters of the month in captial letters (e.g. JAN)')
end

%% Lunar Phase Calculations
if month == 1 || month == 2
    a = 1;
    else
        a = 0;
end

y = year - a +4800;
m = month + 12*a -3;

% Julian Day Number
J = day + floor((153*m+2)/5) + 365*y + floor(y/4) - floor(y/100) + floor(y/400) - 32045;
J0 = 2415021;
J_change = J - J0;

% Lunar Phase
T = 29.530588853;
L=sin(pi*mod(J_change,T)/T)^2;

%%
L_Percent = L*100;
fprintf('\n%s %s %s: \n', MMM, DD, YYYY);
fprintf('Illumination = %.1f percent\n', L_Percent);

L_mod = mod(J_change,T)/T;

if L_mod < 0.5
    fprintf('Waxing\n');
else
    fprintf('Waning\n');
end


