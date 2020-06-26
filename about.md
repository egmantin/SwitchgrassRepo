
# Predictive Biomass Yield Models

Through the compilation of yield data, edaphic and climatic conditions from
scientific literature into a database, a linear mixed-effects model was created
to predict biomass yield for each dedicated biomass crop: Switchgrass, Miscanthus,
Poplar and Willow.  The data were refined based on growing crops in Nova Scotia,
Canada, so appropriate climatic conditions were determined by plant hardiness
zones (PHZ).

The values for precipitation and growing degree days are reported for a typical
Nova Scotia growing season: April through October.

**Precipitation** - total precipitation over the growing season.  Reported in mm.

**Growing Degree Days** - accumulation of heat units that contribute to plant growth
based on a specific base temperature.  $T_{MAX}$ is the maximum daily temperature
($^\circ$C), $T_{MIN}$ is the minimum daily temperature and $T_{BASE}$ is the base
temperature ($^\circ$C), representing the lowest possible temperature where plant
growth still occurs.

$$GDD = \frac{T_{MAX} + T_{MIN}}{2} - T_{BASE}$$




