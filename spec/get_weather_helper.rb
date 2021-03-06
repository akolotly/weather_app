require 'open_weather'

RESPONSE_FORECAST_MOCK = {
  'cod' => '200',
  'message' => 0.002,
  'cnt' => 40,
  'list' =>
  [{ 'dt' => 1_530_198_000,
     'main' =>
     { 'temp' => 23.19,
       'temp_min' => 23.19,
       'temp_max' => 25.61,
       'pressure' => 1028.89,
       'sea_level' => 1031.54,
       'grnd_level' => 1028.89,
       'humidity' => 42,
       'temp_kf' => -2.42 },
     'weather' => [{ 'id' => 801, 'main' => 'Clouds', 'description' => 'облачно', 'icon' => '02d' }],
     'clouds' => { 'all' => 12 },
     'wind' => { 'speed' => 3.55, 'deg' => 265.506 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-28 15:00:00' },
   { 'dt' => 1_530_208_800,
     'main' =>
     { 'temp' => 21.35,
       'temp_min' => 21.35,
       'temp_max' => 23.17,
       'pressure' => 1026.95,
       'sea_level' => 1029.55,
       'grnd_level' => 1026.95,
       'humidity' => 45,
       'temp_kf' => -1.82 },
     'weather' => [{ 'id' => 800, 'main' => 'Clear', 'description' => 'ясно', 'icon' => '01d' }],
     'clouds' => { 'all' => 0 },
     'wind' => { 'speed' => 3.16, 'deg' => 268.505 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-28 18:00:00' },
   { 'dt' => 1_530_219_600,
     'main' =>
     { 'temp' => 16.67,
       'temp_min' => 16.67,
       'temp_max' => 17.88,
       'pressure' => 1024.64,
       'sea_level' => 1027.29,
       'grnd_level' => 1024.64,
       'humidity' => 60,
       'temp_kf' => -1.21 },
     'weather' => [{ 'id' => 800, 'main' => 'Clear', 'description' => 'ясно', 'icon' => '01n' }],
     'clouds' => { 'all' => 0 },
     'wind' => { 'speed' => 1.56, 'deg' => 259.501 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-06-28 21:00:00' },
   { 'dt' => 1_530_230_400,
     'main' =>
     { 'temp' => 15.22,
       'temp_min' => 15.22,
       'temp_max' => 15.83,
       'pressure' => 1022.22,
       'sea_level' => 1024.94,
       'grnd_level' => 1022.22,
       'humidity' => 73,
       'temp_kf' => -0.61 },
     'weather' => [{ 'id' => 800, 'main' => 'Clear', 'description' => 'ясно', 'icon' => '01n' }],
     'clouds' => { 'all' => 0 },
     'wind' => { 'speed' => 2.26, 'deg' => 171.004 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-06-29 00:00:00' },
   { 'dt' => 1_530_241_200,
     'main' =>
     { 'temp' => 18.13, 'temp_min' => 18.13, 'temp_max' => 18.13, 'pressure' => 1019.57, 'sea_level' => 1022.24, 'grnd_level' => 1019.57, 'humidity' => 61, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 803, 'main' => 'Clouds', 'description' => 'пасмурно', 'icon' => '04d' }],
     'clouds' => { 'all' => 68 },
     'wind' => { 'speed' => 3.22, 'deg' => 199.501 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-29 03:00:00' },
   { 'dt' => 1_530_252_000,
     'main' => { 'temp' => 23, 'temp_min' => 23, 'temp_max' => 23, 'pressure' => 1016.53, 'sea_level' => 1019.31, 'grnd_level' => 1016.53, 'humidity' => 45, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 801, 'main' => 'Clouds', 'description' => 'облачно', 'icon' => '02d' }],
     'clouds' => { 'all' => 24 },
     'wind' => { 'speed' => 3.46, 'deg' => 205.004 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-29 06:00:00' },
   { 'dt' => 1_530_262_800,
     'main' =>
     { 'temp' => 23.98, 'temp_min' => 23.98, 'temp_max' => 23.98, 'pressure' => 1014.69, 'sea_level' => 1017.42, 'grnd_level' => 1014.69, 'humidity' => 43, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 803, 'main' => 'Clouds', 'description' => 'пасмурно', 'icon' => '04d' }],
     'clouds' => { 'all' => 68 },
     'wind' => { 'speed' => 4.37, 'deg' => 236.001 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-29 09:00:00' },
   { 'dt' => 1_530_273_600,
     'main' =>
     { 'temp' => 21.98, 'temp_min' => 21.98, 'temp_max' => 21.98, 'pressure' => 1014.2, 'sea_level' => 1017.17, 'grnd_level' => 1014.2, 'humidity' => 45, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 804, 'main' => 'Clouds', 'description' => 'пасмурно', 'icon' => '04d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 5.11, 'deg' => 234.003 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-29 12:00:00' },
   { 'dt' => 1_530_284_400,
     'main' =>
     { 'temp' => 17.57, 'temp_min' => 17.57, 'temp_max' => 17.57, 'pressure' => 1014.38, 'sea_level' => 1016.99, 'grnd_level' => 1014.38, 'humidity' => 65, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 64 },
     'wind' => { 'speed' => 4.52, 'deg' => 257 },
     'rain' => { '3h' => 0.135 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-29 15:00:00' },
   { 'dt' => 1_530_295_200,
     'main' =>
     { 'temp' => 16.53, 'temp_min' => 16.53, 'temp_max' => 16.53, 'pressure' => 1013.97, 'sea_level' => 1016.75, 'grnd_level' => 1013.97, 'humidity' => 67, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 802, 'main' => 'Clouds', 'description' => 'слегка облачно', 'icon' => '03d' }],
     'clouds' => { 'all' => 36 },
     'wind' => { 'speed' => 4.97, 'deg' => 276.003 },
     'rain' => {},
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-29 18:00:00' },
   { 'dt' => 1_530_306_000,
     'main' =>
     { 'temp' => 13.98, 'temp_min' => 13.98, 'temp_max' => 13.98, 'pressure' => 1015.2, 'sea_level' => 1018.07, 'grnd_level' => 1015.2, 'humidity' => 73, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10n' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 5.14, 'deg' => 317.5 },
     'rain' => { '3h' => 0.08 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-06-29 21:00:00' },
   { 'dt' => 1_530_316_800,
     'main' =>
     { 'temp' => 10.95, 'temp_min' => 10.95, 'temp_max' => 10.95, 'pressure' => 1017.07, 'sea_level' => 1019.78, 'grnd_level' => 1017.07, 'humidity' => 71, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10n' }],
     'clouds' => { 'all' => 32 },
     'wind' => { 'speed' => 4.97, 'deg' => 318.501 },
     'rain' => { '3h' => 0.02 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-06-30 00:00:00' },
   { 'dt' => 1_530_327_600,
     'main' =>
     { 'temp' => 10.37, 'temp_min' => 10.37, 'temp_max' => 10.37, 'pressure' => 1017.98, 'sea_level' => 1020.72, 'grnd_level' => 1017.98, 'humidity' => 70, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 76 },
     'wind' => { 'speed' => 4.65, 'deg' => 322.501 },
     'rain' => { '3h' => 0.06 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-30 03:00:00' },
   { 'dt' => 1_530_338_400,
     'main' =>
     { 'temp' => 11.65, 'temp_min' => 11.65, 'temp_max' => 11.65, 'pressure' => 1018.96, 'sea_level' => 1021.68, 'grnd_level' => 1018.96, 'humidity' => 66, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 4.92, 'deg' => 331.5 },
     'rain' => { '3h' => 0.08 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-30 06:00:00' },
   { 'dt' => 1_530_349_200,
     'main' =>
     { 'temp' => 12.22, 'temp_min' => 12.22, 'temp_max' => 12.22, 'pressure' => 1020.44, 'sea_level' => 1023.24, 'grnd_level' => 1020.44, 'humidity' => 65, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 5.02, 'deg' => 347.001 },
     'rain' => { '3h' => 0.055 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-30 09:00:00' },
   { 'dt' => 1_530_360_000,
     'main' =>
     { 'temp' => 12.93, 'temp_min' => 12.93, 'temp_max' => 12.93, 'pressure' => 1021.65, 'sea_level' => 1024.42, 'grnd_level' => 1021.65, 'humidity' => 65, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 5.66, 'deg' => 0.504883 },
     'rain' => { '3h' => 0.085 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-30 12:00:00' },
   { 'dt' => 1_530_370_800,
     'main' => { 'temp' => 12.07, 'temp_min' => 12.07, 'temp_max' => 12.07, 'pressure' => 1023, 'sea_level' => 1025.61, 'grnd_level' => 1023, 'humidity' => 69, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 6.1, 'deg' => 13.5006 },
     'rain' => { '3h' => 0.225 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-30 15:00:00' },
   { 'dt' => 1_530_381_600,
     'main' =>
     { 'temp' => 11.78, 'temp_min' => 11.78, 'temp_max' => 11.78, 'pressure' => 1024.41, 'sea_level' => 1027.02, 'grnd_level' => 1024.41, 'humidity' => 71, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 6.47, 'deg' => 22.5091 },
     'rain' => { '3h' => 0.2 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-06-30 18:00:00' },
   { 'dt' => 1_530_392_400,
     'main' =>
     { 'temp' => 11.73, 'temp_min' => 11.73, 'temp_max' => 11.73, 'pressure' => 1025.35, 'sea_level' => 1027.95, 'grnd_level' => 1025.35, 'humidity' => 64, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10n' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 7.21, 'deg' => 32.0094 },
     'rain' => { '3h' => 0.005 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-06-30 21:00:00' },
   { 'dt' => 1_530_403_200,
     'main' =>
     { 'temp' => 10.49, 'temp_min' => 10.49, 'temp_max' => 10.49, 'pressure' => 1025.69, 'sea_level' => 1028.35, 'grnd_level' => 1025.69, 'humidity' => 68, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 804, 'main' => 'Clouds', 'description' => 'пасмурно', 'icon' => '04n' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 7.42, 'deg' => 34.0005 },
     'rain' => {},
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-07-01 00:00:00' },
   { 'dt' => 1_530_414_000,
     'main' =>
     { 'temp' => 10.64, 'temp_min' => 10.64, 'temp_max' => 10.64, 'pressure' => 1025.7, 'sea_level' => 1028.35, 'grnd_level' => 1025.7, 'humidity' => 73, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 7.71, 'deg' => 36.0013 },
     'rain' => { '3h' => 0.085 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-01 03:00:00' },
   { 'dt' => 1_530_424_800,
     'main' =>
     { 'temp' => 11.67, 'temp_min' => 11.67, 'temp_max' => 11.67, 'pressure' => 1025.45, 'sea_level' => 1028.18, 'grnd_level' => 1025.45, 'humidity' => 70, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 8.62, 'deg' => 37.5004 },
     'rain' => { '3h' => 0.07 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-01 06:00:00' },
   { 'dt' => 1_530_435_600,
     'main' =>
     { 'temp' => 12.49, 'temp_min' => 12.49, 'temp_max' => 12.49, 'pressure' => 1025.24, 'sea_level' => 1027.86, 'grnd_level' => 1025.24, 'humidity' => 73, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 100 },
     'wind' => { 'speed' => 9.53, 'deg' => 40.0052 },
     'rain' => { '3h' => 0.455 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-01 09:00:00' },
   { 'dt' => 1_530_446_400,
     'main' =>
     { 'temp' => 11.06, 'temp_min' => 11.06, 'temp_max' => 11.06, 'pressure' => 1025.04, 'sea_level' => 1027.72, 'grnd_level' => 1025.04, 'humidity' => 96, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 501, 'main' => 'Rain', 'description' => 'дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 9.35, 'deg' => 43.0102 },
     'rain' => { '3h' => 4.905 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-01 12:00:00' },
   { 'dt' => 1_530_457_200,
     'main' =>
     { 'temp' => 11.19, 'temp_min' => 11.19, 'temp_max' => 11.19, 'pressure' => 1024.68, 'sea_level' => 1027.37, 'grnd_level' => 1024.68, 'humidity' => 99, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 501, 'main' => 'Rain', 'description' => 'дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 9.43, 'deg' => 47.5 },
     'rain' => { '3h' => 4.63 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-01 15:00:00' },
   { 'dt' => 1_530_468_000,
     'main' =>
     { 'temp' => 11.34, 'temp_min' => 11.34, 'temp_max' => 11.34, 'pressure' => 1024.49, 'sea_level' => 1027.16, 'grnd_level' => 1024.49, 'humidity' => 98, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 100 },
     'wind' => { 'speed' => 8.57, 'deg' => 49 },
     'rain' => { '3h' => 2.82 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-01 18:00:00' },
   { 'dt' => 1_530_478_800,
     'main' =>
     { 'temp' => 11.81, 'temp_min' => 11.81, 'temp_max' => 11.81, 'pressure' => 1023.91, 'sea_level' => 1026.51, 'grnd_level' => 1023.91, 'humidity' => 97, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10n' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 7.96, 'deg' => 51.5011 },
     'rain' => { '3h' => 1.3 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-07-01 21:00:00' },
   { 'dt' => 1_530_489_600,
     'main' =>
     { 'temp' => 12.56, 'temp_min' => 12.56, 'temp_max' => 12.56, 'pressure' => 1022.67, 'sea_level' => 1025.38, 'grnd_level' => 1022.67, 'humidity' => 97, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10n' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 6.83, 'deg' => 53.0001 },
     'rain' => { '3h' => 0.7 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-07-02 00:00:00' },
   { 'dt' => 1_530_500_400,
     'main' =>
     { 'temp' => 14.62, 'temp_min' => 14.62, 'temp_max' => 14.62, 'pressure' => 1021.63, 'sea_level' => 1024.36, 'grnd_level' => 1021.63, 'humidity' => 95, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 5.55, 'deg' => 56.502 },
     'rain' => { '3h' => 2.72 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-02 03:00:00' },
   { 'dt' => 1_530_511_200,
     'main' =>
     { 'temp' => 17.52, 'temp_min' => 17.52, 'temp_max' => 17.52, 'pressure' => 1021.41, 'sea_level' => 1024.14, 'grnd_level' => 1021.41, 'humidity' => 93, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 100 },
     'wind' => { 'speed' => 5.11, 'deg' => 62.0005 },
     'rain' => { '3h' => 1.89 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-02 06:00:00' },
   { 'dt' => 1_530_522_000,
     'main' =>
     { 'temp' => 19.4, 'temp_min' => 19.4, 'temp_max' => 19.4, 'pressure' => 1021.36, 'sea_level' => 1024.09, 'grnd_level' => 1021.36, 'humidity' => 98, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 5.31, 'deg' => 65.5005 },
     'rain' => { '3h' => 2.45 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-02 09:00:00' },
   { 'dt' => 1_530_532_800,
     'main' =>
     { 'temp' => 20.86, 'temp_min' => 20.86, 'temp_max' => 20.86, 'pressure' => 1020.53, 'sea_level' => 1023.24, 'grnd_level' => 1020.53, 'humidity' => 91, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 76 },
     'wind' => { 'speed' => 4.56, 'deg' => 49.0006 },
     'rain' => { '3h' => 1.29 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-02 12:00:00' },
   { 'dt' => 1_530_543_600,
     'main' =>
     { 'temp' => 20.33, 'temp_min' => 20.33, 'temp_max' => 20.33, 'pressure' => 1019.67, 'sea_level' => 1022.41, 'grnd_level' => 1019.67, 'humidity' => 88, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 4.61, 'deg' => 53.5002 },
     'rain' => { '3h' => 0.11 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-02 15:00:00' },
   { 'dt' => 1_530_554_400,
     'main' =>
     { 'temp' => 18.73, 'temp_min' => 18.73, 'temp_max' => 18.73, 'pressure' => 1018.95, 'sea_level' => 1021.75, 'grnd_level' => 1018.95, 'humidity' => 98, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 3.02, 'deg' => 82.0026 },
     'rain' => { '3h' => 0.56 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-02 18:00:00' },
   { 'dt' => 1_530_565_200,
     'main' =>
     { 'temp' => 15.96, 'temp_min' => 15.96, 'temp_max' => 15.96, 'pressure' => 1018.76, 'sea_level' => 1021.41, 'grnd_level' => 1018.76, 'humidity' => 100, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10n' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 3.11, 'deg' => 203.501 },
     'rain' => { '3h' => 1.11 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-07-02 21:00:00' },
   { 'dt' => 1_530_576_000,
     'main' =>
     { 'temp' => 13.58, 'temp_min' => 13.58, 'temp_max' => 13.58, 'pressure' => 1018.92, 'sea_level' => 1021.74, 'grnd_level' => 1018.92, 'humidity' => 100, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 501, 'main' => 'Rain', 'description' => 'дождь', 'icon' => '10n' }],
     'clouds' => { 'all' => 92 },
     'wind' => { 'speed' => 4.2, 'deg' => 216.003 },
     'rain' => { '3h' => 8.03 },
     'sys' => { 'pod' => 'n' },
     'dt_txt' => '2018-07-03 00:00:00' },
   { 'dt' => 1_530_586_800,
     'main' =>
     { 'temp' => 13.45, 'temp_min' => 13.45, 'temp_max' => 13.45, 'pressure' => 1019.22, 'sea_level' => 1021.84, 'grnd_level' => 1019.22, 'humidity' => 98, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 500, 'main' => 'Rain', 'description' => 'легкий дождь', 'icon' => '10d' }],
     'clouds' => { 'all' => 8 },
     'wind' => { 'speed' => 3.16, 'deg' => 212.504 },
     'rain' => { '3h' => 0.35 },
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-03 03:00:00' },
   { 'dt' => 1_530_597_600,
     'main' =>
     { 'temp' => 16.87, 'temp_min' => 16.87, 'temp_max' => 16.87, 'pressure' => 1019.13, 'sea_level' => 1021.7, 'grnd_level' => 1019.13, 'humidity' => 95, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 800, 'main' => 'Clear', 'description' => 'ясно', 'icon' => '01d' }],
     'clouds' => { 'all' => 0 },
     'wind' => { 'speed' => 2.52, 'deg' => 192.502 },
     'rain' => {},
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-03 06:00:00' },
   { 'dt' => 1_530_608_400,
     'main' =>
     { 'temp' => 20.1, 'temp_min' => 20.1, 'temp_max' => 20.1, 'pressure' => 1019.39, 'sea_level' => 1022.07, 'grnd_level' => 1019.39, 'humidity' => 82, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 800, 'main' => 'Clear', 'description' => 'ясно', 'icon' => '01d' }],
     'clouds' => { 'all' => 0 },
     'wind' => { 'speed' => 3.31, 'deg' => 197.504 },
     'rain' => {},
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-03 09:00:00' },
   { 'dt' => 1_530_619_200,
     'main' =>
     { 'temp' => 21.12, 'temp_min' => 21.12, 'temp_max' => 21.12, 'pressure' => 1018.95, 'sea_level' => 1021.53, 'grnd_level' => 1018.95, 'humidity' => 81, 'temp_kf' => 0 },
     'weather' => [{ 'id' => 800, 'main' => 'Clear', 'description' => 'ясно', 'icon' => '02d' }],
     'clouds' => { 'all' => 8 },
     'wind' => { 'speed' => 1.81, 'deg' => 189 },
     'rain' => {},
     'sys' => { 'pod' => 'd' },
     'dt_txt' => '2018-07-03 12:00:00' }],
  'city' => { 'id' => 519_690, 'name' => 'Novaya Gollandiya', 'coord' => { 'lat' => 59.9294, 'lon' => 30.2905 }, 'country' => 'RU' }
}.freeze
