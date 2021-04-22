local dot = Vector3.new().Dot;
local gv = Vector3.new(0, 196.2, 0);
local function solvebiquadratic(a, b, c)
    local p = (b * b - 4 * a * c) ^ 0.5;
    local r0 = (-b - p) / (2 * a);
    r0 = r0 ^ 0.5;
    return r0;
end

local function solvetrajectory(origin, target, speed)
    local dir = target - origin;
    local coef0 = dot(gv, gv) / 4;
    local coef1 = dot(gv, dir) - speed * speed;
    local const = dot(dir, dir);
    local r = solvebiquadratic(coef0, coef1, const);
    return (r and gv * r / 2 + dir / r), r;
end


return solvetrajectory;
