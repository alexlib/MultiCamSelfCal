% preparedata
%
% reads BlueC *.rad file and transform data
% for the CalTech Camera calibration toolbox

function [X,x] = preparedata(filename);

v = version; Octave = v(1)<'5';  % Crude Octave test

if Octave,
  datamat = load(filename);
  if isstruct(datamat)
    datamat = datamat.corresp;
  end
else
  datamat = load(filename,'-ASCII');
end

X = datamat(:,1:3)'; % 3D points
x = datamat(:,5:6)'; % 2D projections

return;
