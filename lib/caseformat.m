%CASEFORMAT    Defines the MATPOWER case file format.
%   A MATPOWER case file is an M-file or MAT-file which defines the variables
%   baseMVA, bus, gen, branch, area, and gencost. The format of the data is
%   similar to PTI format except where noted. An item marked with (+) indicates
%   that it is included in this data but is not part of the PTI format. An item
%   marked with (-) is one that is in the PTI format but is not included here.
%
%   Bus Data Format
%       1   bus number (1 to 29997)
%       2   bus type
%               PQ bus          = 1
%               PV bus          = 2
%               reference bus   = 3
%               isolated bus    = 4
%       3   Pd, real power demand (MW)
%       4   Qd, reactive power demand (MVAr)
%       5   Gs, shunt conductance (MW (demanded) at V = 1.0 p.u.)
%       6   Bs, shunt susceptance (MVAr (injected) at V = 1.0 p.u.)
%       7   area number, 1-100
%       8   Vm, voltage magnitude (p.u.)
%       9   Va, voltage angle (degrees)
%   (-)     (bus name)
%       10  baseKV, base voltage (kV)
%       11  zone, loss zone (1-999)
%   (+) 12  maxVm, maximum voltage magnitude (p.u.)
%   (+) 13  minVm, minimum voltage magnitude (p.u.)
%
%   Generator Data Format
%       1   bus number
%   (-)     (machine identifier, 0-9, A-Z)
%       2   Pg, real power output (MW)
%       3   Qg, reactive power output (MVAr)
%       4   Qmax, maximum reactive power output (MVAr)
%       5   Qmin, minimum reactive power output (MVAr)
%       6   Vg, voltage magnitude setpoint (p.u.)
%   (-)     (remote controlled bus index)
%       7   mBase, total MVA base of this machine, defaults to baseMVA
%   (-)     (machine impedance, p.u. on mBase)
%   (-)     (step up transformer impedance, p.u. on mBase)
%   (-)     (step up transformer off nominal turns ratio)
%       8   status,  >  0 - machine in service
%                    <= 0 - machine out of service
%   (-)     (% of total VAr's to come from this gen in order to hold V at
%               remote bus controlled by several generators)
%       9   Pmax, maximum real power output (MW)
%       10  Pmin, minimum real power output (MW)
%
%   Branch Data Format
%       1   f, from bus number
%       2   t, to bus number
%   (-)     (circuit identifier)
%       3   r, resistance (p.u.)
%       4   x, reactance (p.u.)
%       5   b, total line charging susceptance (p.u.)
%       6   rateA, MVA rating A (long term rating)
%       7   rateB, MVA rating B (short term rating)
%       8   rateC, MVA rating C (emergency rating)
%       9   ratio, transformer off nominal turns ratio ( = 0 for lines )
%           (taps at 'from' bus, impedance at 'to' bus, i.e. ratio = Vf / Vt)
%       10  angle, transformer phase shift angle (degrees)
%   (-)     (Gf, shunt conductance at from bus p.u.)
%   (-)     (Bf, shunt susceptance at from bus p.u.)
%   (-)     (Gt, shunt conductance at to bus p.u.)
%   (-)     (Bt, shunt susceptance at to bus p.u.)
%       11  initial branch status, 1 - in service, 0 - out of service
%
% (+) Area Data Format
%       1   i, area number
%       2   price_ref_bus, reference bus for that area
% 
% (+) Generator Cost Data Format
%       NOTE: If gen has n rows, then the first n rows of gencost contain
%       the cost for active power produced by the corresponding generators.
%       If gencost has 2*n rows then rows n+1 to 2*n contain the reactive
%       power costs in the same format.
%       1   model, 1 - piecewise linear, 2 - polynomial
%       2   startup, startup cost in US dollars
%       3   shutdown, shutdown cost in US dollars
%       4   n, number of cost coefficients to follow for polynomial
%           (or data points for piecewise linear) total cost function
%       5 and following, cost data, piecewise linear data as:
%                   x0, y0, x1, y1, x2, y2, ...
%           and polynomial data as, e.g.:
%                   c2, c1, c0
%           where the polynomial is c0 + c1*P + c2*P^2
%