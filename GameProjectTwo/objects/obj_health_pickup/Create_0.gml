spread_timer = 0;
wspread = 100;
hspread = wspread/2;

init_y = y;
init_x = x;
end_x = x + random_range(-wspread, wspread);
end_y = random_range(y - sqrt(sqr(hspread) - (sqr(end_x - x) * sqr(hspread))/sqr(wspread)), y + sqrt(sqr(hspread) - (sqr(end_x - x) * sqr(hspread))/sqr(wspread)));