function states = updatestates(states,dx)

for kk = 1:numel(states)

    states{kk}.value = states{kk}.value + dx(states{kk}.range);
    
    if strcmp(states{kk}.type, 'pose')

        while states{kk}.value(3) > pi
            states{kk}.value(3) = states{kk}.value(3) - 2*pi;
        end
        while states{kk}.value(3) < -pi
            states{kk}.value(3) = states{kk}.value(3) + 2*pi;
        end
    end
end
end