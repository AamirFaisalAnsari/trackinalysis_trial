%old_x = [NaN, NaN, 5, 6, NaN, 8, NaN, NaN, NaN, 12.5, NaN];
function x=fill_tracks_afa(old_x)
% Find the first and last non-NaN values
% first_idx = find(~isnan(old_x), 1);
% last_idx = find(~isnan(old_x), 1, 'last');
% 
% % Extract the valid portion of the array
% valid_x = old_x(first_idx:last_idx);
% 
% % Linearly interpolate the NaN values
% interpolated_x = interp1(find(~isnan(valid_x)), valid_x(~isnan(valid_x)), 1:numel(valid_x), 'linear');
% 
% % Create the new array, 'x', by inserting NaN values at the positions of the original NaN values
% x = NaN(size(old_x));
% x(first_idx:last_idx) = interpolated_x;
x=old_x;
x = x(~isnan(x));
end