local dot = Vector3.new().Dot;
local function solvebiquadratic(a, b, c)
    local p = (b * b - 4 * a * c) ^ 0.5;
    local r0 = (-b - p) / (2 * a);
    r0 = r0 ^ 0.5;
    return r0;
end

local function solvetrajectory(origin, target, accel, speed)
    local dir = target - origin;
    local coef0 = dot(accel, accel) / 4;
    local coef1 = dot(accel, dir) - speed * speed;
    local const = dot(dir, dir);
    local time = solvebiquadratic(coef0, coef1, const);
    return (time and accel * time / 2 + dir / time), time;
end


return solvetrajectory;
