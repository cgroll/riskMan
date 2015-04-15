% Risk management
% 	Introduction to the modeling of assets
% Christian Groll

# Interest rates and returns

### General problem

**Quantity of interest**

\begin{equation*}
\bf{Z}=g(\bf{X}),\quad \bf{X}=(X_{1},\ldots, X_{d})
\end{equation*}

- $X_{i}$ are random variables
- $X_{i}$ represent *uncertain risk factors*

### Examples

. . .

#### portfolio return
- individual stocks $(X_{1},\ldots, X_{d})$
- $g$ is aggregation function

. . .

#### option payoff

- single underlying $X_{1}$
- $g$ is payoff function


### Certain future payments

- in the simplest case, all risk factors $(X_{1},\ldots, X_{d})$ are
  perfectly known

. . . 

#### Example

- *bank account* with given interest rate


### Aggregation

- even without uncertainty, our quantity of interest commonly implies
  a *multi-dimensional* setting

. . .

#### Example

- *multi-period wealth* calculation with given annual interest rates


## Interest and compounding

###

- given an interest rate of $r$ per period and initial wealth $W_{t}$,
  the wealth one period ahead is calculated as 

	\begin{equation*}
	W_{t+1}=W_{t}\left(1+r\right)
	\end{equation*}

. . .

#### Example

- $r=0.05$ (annual rate), $W_{0}=500.000$, after one year

. . .

$$500.000\left(1+\frac{5}{100}\right)= 500.000\left(1+0.05\right)=525.000$$

###

- multi-period compound interest:

\begin{equation*}
W_{T}(r,W_{0})=W_{0}(1+r)^{T}
\end{equation*}

. . .

#### Non-constant interest rates

- for the case of *changing annual interest rates*, end-of-period
  wealth is given by

\begin{align*}
W_{1:t} & =\left(1+r_{0}\right)\cdot\left(1+r_{1}\right)\cdot...\cdot\left(1+r_{t-1}\right)\\
 & =\prod_{i=0}^{t-1}\left(1+r_{i}\right)
\end{align*}

### Logarithmic interest rates

- logarithmic interest rates or *continuously compounded* interest
  rates are given by

\begin{equation*}
r_{t}^{log}:=\ln\left(1+r_{t}\right)
\end{equation*}


### Aggregation

- with logarithmic interest rates aggregation becomes a *sum* rather
  than a *product* of sub-period interest rates:

. . .

\begin{align*}
r_{1:t}^{log}&=\ln\left( 1+r_{1:t} \right) \\
&=\ln\left(\prod_{i=1}^{t}\left(1+r_{i}\right)\right) \\
&=\ln\left(1+r_{1}\right)+\ln\left(1+r_{2}\right)+\ldots+\ln\left(1+r_{t}\right)\\
 & =r_{1}^{log}+r_{2}^{log}+\ldots+r_{t}^{log}\\
&=\sum_{i=1}^{t} \left( \ln (1+r_{i})\right)
\end{align*}

###

\begin{align*}
r_{t,t+n}^{log} & :=\ln\left(1+r_{t,t+n}\right)\\
 & =\ln\left[\left(1+r_{t}\right)\left(1+r_{t+1}\right)\ldots\left(1+r_{t+n}\right)\right]\\
 & =\ln\left(1+r_{t}\right)+\ln\left(1+r_{t+1}\right)+\ldots+\ln\left(1+r_{t+n}\right)\\
 & =r_{t}^{log}+r_{t+1}^{log}+\ldots+r_{t+n}^{log}
\end{align*}


### 

- interest rate aggregation
- log interest rate aggregation

- relation: log interest rates as limit of discrete interest rates 


### Returns

- non-stationarity: look at returns, not prices
- going back to prices naturally involves aggregation 


# Probability theory

### 

- *randomness*: the result is not known in advance
- *probability theory*: captures randomness in mathematical framework

## Probability spaces and random variables 

### 

- *sample space* $\Omega$: set of all possible outcomes or elementary
  events $\omega$ 

. . .

#### Examples: *discrete* sample space:

- roulette: $\Omega_{1}=\left\{ \mbox{red,black}\right\}$
- performance: $\Omega_{2}=\left\{ \mbox{good,moderate,bad}\right\}$
- die: $\Omega_{3}=\left\{ 1,2,3,4,5,6\right\}$

. . .

#### Examples: *continuous* sample space:
- temperature: $\Omega_{4}=[-40,50]$
- log-returns: $\Omega_{5}=]-\infty,\infty[$


### Events

- a subset $A\subset\Omega$ consisting of more than one elementary
  event $\omega$ is called *event*

. . .

#### Examples

- "at least moderate performance": 
	\begin{equation*}
	A=\left\{ \mbox{good,moderate}\right\} \subset\Omega_{2}
	\end{equation*}

. . .

- "even number": 
	\begin{equation*}
	A=\left\{ 2,4,6\right\} \subset\Omega_{3}
	\end{equation*}

. . .

- "warmer than 10 degrees":
	\begin{equation*}
	A=]10,\infty[\subset\Omega_{4}
	\end{equation*}

### Event space

- the set of all events of $\Omega$ is called *event space*
  $\mathcal{F}$ 
- usually it contains all possible subsets of $\Omega$: it is the
  *power set* of $\mathcal{P}\left(\Omega\right)$ 


### Events

- $\left\{ \right\}$ denotes the *empty set*

. . .

#### Event space example
\begin{align*}
\mathcal{P}\left(\Omega_{2}\right)&=\left\{ \Omega,\left\{ \right\} \right\} \cup\left\{ \mbox{good}\right\} \cup\left\{ \mbox{moderate}\right\} \\
&=\cup\left\{ \mbox{bad}\right\} \cup\left\{ \mbox{good,moderate}\right\} \cup\left\{ \mbox{good,bad}\right\} \cup\left\{ \mbox{moderate,bad}\right\}
\end{align*}

### Events

- an event $A$ is said to *occur* if any $\omega\in A$ occurs

. . .

#### Example

If the performance happens to be $\omega=\left\{ \mbox{good}\right\}
,$ then also the event $A=$ "at least moderate performance" has
occured, since $\omega\subset A$.


###

#### Probability measure


A real-valued set function
$\mathbb{P}:\mathcal{F}\rightarrow\mathbb{R}$, with properties 

. . .

- $\mathbb{P}\left(A\right)>0$ for all $A\subseteq\Omega$

. . .

- $\mathbb{P}\left(\Omega\right)=1$

. . .

- For each finite or countably infinite collection of *disjoint*
  events $\left(A_{i}\right)$ it holds: 
	$$\mathbb{P}\left(\cup_{i\in I}A_{i}\right)=\sum_{i\in I}\mathbb{P}\left(A_{i}\right)$$


. . .

$\Rightarrow$ quantifies for each event a probability of occurance


. . .

#### Definition
The 3-tuple $\left\{ \Omega,\mathcal{F},\mathbb{P}\right\}$ is called
*probability space*. 

 
### Random variable

- instead of outcome $\omega$ itself, usually a mapping or function of
  $\omega$ is in the focus: when playing roulette, instead of outcome
  "red" it is more useful to consider associated gain or loss of a bet
  on "color"

. . .

- conversion of *categoral* outcomes to *real numbers* allows for
  further measurements / information extraction: expectation,
  dispersion,...

. . .

#### Definition

Let $\left\{ \Omega,\mathcal{F},\mathbb{P}\right\}$ be a probability
space. If $X:\Omega\rightarrow\mathbb{R}$ is a real-valued function
with the elements of $\Omega$ as its domain, then $X$ is called
*random variable*. 

### Example

![random variable with discrete values](/home/chris/research/teaching/riskMan/pics/intro_pics/01categToRandVar.png)


### Density function

- a *discrete* random variable consists of a countable number of
  elements, while a *continuous* random variable can take any real
  value in a given interval 

. . .

- a *probability density function* determines the probability
  (possibly $0$) for each event 

. . .

#### Discrete density function

For each $x_{i}\in X\left(\Omega\right)=\left\{
x_{i}|x_{i}=X\left(\omega\right),\omega\in\Omega\right\}$, the
function 
\begin{equation*}
f\left(x_{i}\right)=\mathbb{P}\left(X=x_{i}\right)
\end{equation*}

assigns a value corresponding to the probability.

###

#### Continuous density function

In contrast, the values of a continuous density function
$f\left(x\right),$ $x\in\left\{
x|x=X\left(\omega\right),\omega\in\Omega\right\}$ are not
probabilities itself. However, they shed light on the relative
probabilities of occurrence. Given $f\left(y\right)=2\cdot
f\left(z\right),$ the occurrence of $y$ is twice as probable as the
occurrence of $z$.


### Example

![](/home/chris/research/teaching/riskMan/pics/intro_pics/exDiscCont02.png)

### 

#### Cumulative distribution function
The *cumulative distribution function* (cdf) of random variable $X$,
denoted by $F\left(x\right),$ indicates the probability that $X$
assumes a value that is lower than or equal to $x,$ where $x$ is any
real number. That is 

\begin{equation*}
F\left(x\right)=\mathbb{P}\left(X\leq x\right),\quad-\infty<x<\infty.
\end{equation*}

###

a cdf has the following properties:

. . .

- $F\left(x\right)$ is a nondecreasing function of $x;$

. . .

- $\lim_{x\rightarrow\infty}F\left(x\right)=1;$

. . .

- $\lim_{x\rightarrow-\infty}F\left(x\right)=0.$

. . .

- furthermore:
\begin{equation*}
\mathbb{P}\left(a<X\leq b\right)=F\left(b\right)-F\left(a\right),\quad\mbox{for all }b>a
\end{equation*}


### 

Interrelation pdf and cdf: **discrete case**

\begin{equation*}
F\left(x\right)=\mathbb{P}\left(X\leq x\right)=\sum_{x_{i}\leq x}\mathbb{P}\left(X=x_{i}\right)
\end{equation*}

![](/home/chris/research/teaching/riskMan/pics/intro_pics/discrPdfCdf03.png)


### 

Interrelation pdf and cdf: **continuous case**

\begin{equation*}
F\left(x\right)=\mathbb{P}\left(X\leq x\right)=\int_{-\infty}^{x}f\left(u\right)du
\end{equation*}

![](/home/chris/research/teaching/riskMan/pics/intro_pics/contPdfCdf04.png)

## Information reduction

### Modelling information

. . .

- both cdf as well as pdf, which is the derivative of the cdf, provide
  complete information about the distribution of the random variable 

. . .

- may not always be necessary / possible to have complete distribution

. . .

- incomplete information modelled via *event space* $\mathcal{F}$


### Example

- sample space given by $\Omega=\{1,3,5,6,7\}$

. . .

- modeling complete information about possible realizations:

	\begin{align*}
	\mathcal{P}\left(\Omega\right) & =\left\{ 1\right\} \cup\left\{ 3\right\} \cup\left\{ 5\right\} \cup\left\{ 6\right\} \cup\left\{ 7\right\} \cup\\
	& \cup\left\{ 1,3\right\} \cup\left\{ 1,5\right\} \cup...\cup\left\{ 6,7\right\} \cup\left\{ 1,3,5\right\} \cup...\cup\left\{ 5,6,7\right\} \cup\\
	& \cup\left\{ 1,3,5,6\right\} \cup...\cup\left\{ 3,5,6,7\right\} \cup\left\{ \Omega,\left\{ \right\} \right\} 
	\end{align*}

. . .

###

- example of event space representing incomplete information could be 

	\begin{equation*}
	\mathcal{F}=\left\{ \left\{ 1,3\right\} ,\left\{ 5\right\} ,\left\{ 6,7\right\} \right\} \cup\left\{ \left\{ 1,3,5\right\} ,\left\{ 1,3,6,7\right\} ,\left\{ 5,6,7\right\} \right\} \cup\left\{ \Omega,\left\{ \right\} \right\} 
	\end{equation*}
	
. . .

- given only incomplete information, originally distinct distributions
  can become indistinguishable 

### Information reduction discrete

![](/home/chris/research/teaching/riskMan/pics/intro_pics/coarseFiltr05.png)


### Information reduction discrete

![](/home/chris/research/teaching/riskMan/pics/intro_pics/diffDistr06.png)



### Information reduction continuous

![](/home/chris/research/teaching/riskMan/pics/intro_pics/contCoarse07.png)


### Measures of random variables

- complete distribution may not always be necessary

. . .

- compress information of complete distribution for better
  comparability with  other distributions

. . .

- compressed information is easier to interpret

. . .

- example: knowing "central location" together with an idea by how
  much $X$ may fluctuate around the center may be sufficient 


###

Classification with respect to several measures can be sufficient:

- probability of negative / positive return

. . .

- return on average

. . .

- worst case

. . .

- measures of *location* and *dispersion*

. . .


Given only incomplete information conveyed by measures, distinct
distributions can become indistinguishable.



### Expectation

The *expectation*, or *mean*, is defined as a weighted average of all
possible realizations of a random variable.

. . .

#### Discrete random variables

The *expected value* $\mathbb{E}\left[X\right]$ is defined as

\begin{equation*}
\mathbb{E}\left[X\right]=\mu_{X}=\sum_{i=1}^{N}x_{i}\mathbb{P}\left(X=x_{i}\right).
\end{equation*}

###

#### Continuous random variables

For a continuous random variable with density function
$f\left(x\right):$ 

\begin{equation*}
\mathbb{E}\left[X\right]=\mu_{X}=\int_{-\infty}^{\infty}xf\left(x\right)dx
\end{equation*}

### Examples

####

\begin{align*}
\mathbb{E}\left[X\right] & =\sum_{i=1}^{5}x_{i}\mathbb{P}\left(X=x_{i}\right)\\
& =1\cdot0.1+3\cdot0.2+5\cdot0.6+6\cdot0.06+7\cdot0.04=4.34
\end{align*}

####

\begin{equation*}
\mathbb{E}\left[X\right]=-2\cdot0.1-1\cdot0.2+7\cdot0.6+8\cdot0.06+9\cdot0.0067=4.34
\end{equation*}

###

![](/home/chris/research/teaching/riskMan/pics/intro_pics/discrExp08.png)


### 

![](/home/chris/research/teaching/riskMan/pics/intro_pics/discrExp09.png)

### Variance

The *variance* provides a measure of dispersion around the mean. 

. . .

#### Discrete random variables

The *variance* is defined by

\begin{equation*}
\mathbb{V}\left[X\right]=\sigma_{X}^{2}=\sum_{i=1}^{N}\left(X_{i}-\mu_{X}\right)^{2}\mathbb{P}\left(X=x_{i}\right),
\end{equation*}

where $\sigma_{X}=\sqrt{\mathbb{V}\left[X\right]}$ denotes the
*standard deviation* of $X.$

###

#### Continuous random variables

For continuous variables, the *variance* is defined by

\begin{equation*}
\mathbb{V}\left[X\right]=\sigma_{X}^{2}=\int_{-\infty}^{\infty}\left(x-\mu_{X}\right)^{2}f\left(x\right)dx
\end{equation*}

. . .

### Example

\begin{align*}
\mathbb{V}\left[X\right] & =\sum_{i=1}^{5}\left(x_{i}-\mu\right)^{2}\mathbb{P}\left(X=x_{i}\right)\\
 & =3.34^{2}\cdot0.1+1.34^{2}\cdot0.2+0.66^{2}\cdot0.6+1.66^{2}\cdot0.06+2.66^{2}\cdot0.04\\
 & =2.1844\neq14.913
\end{align*}

###

![](/home/chris/research/teaching/riskMan/pics/intro_pics/discrExp10.png)


### Quantiles

#### Quantile

Let $X$ be a random variable with cumulative distribution function
$F$. For each $p\in\left(0,1\right)$, the $p$-*quantile* is defined as 

\begin{equation*}
F^{-1}\left(p\right)=\inf\left\{ x|F\left(x\right)\geq p\right\} .
\end{equation*}

### Quantile

- *measure of location*

. . .

- divides distribution in two parts, with *exactly* $p*100$ *percent* of
  the probability mass of the distribution to the left *in the
  continuous case*: random draws from the given distribution $F$ would
  fall $p*100$ percent of the time below the $p$-quantile

. . .

- for *discrete* distributions, the probability mass on the left has
  to be at least $p*100$ percent:

\begin{equation*}
F\left(F^{-1}\left(p\right)\right)=\mathbb{P}\left(X\leq F^{-1}\left(p\right)\right)\geq p
\end{equation*}


### Example

![](/home/chris/research/teaching/riskMan/pics/intro_pics/quantNorm11.png)


### Example: cdf

![](/home/chris/research/teaching/riskMan/pics/intro_pics/quantNorm12.png)


### Example

![](/home/chris/research/teaching/riskMan/pics/intro_pics/quantNorm13.png)


### Example

![](/home/chris/research/teaching/riskMan/pics/intro_pics/quantNorm14.png)


### 

#### Summary: information reduction

*Incomplete information* can occur in two ways: 

. . . 

- a *coarse filtration*

. . .

- only values of some *measures* of the underlying distribution are
  known (*mean*, *dispersion*, *quantiles*)

. . .

Any reduction of information implicitly induces that some formerly
distinguishable distributions are *undistinguishable* on the basis of
the limited information.

. . .

- *tradeoff*: reducing information for better *comprehensibility /
  comparability*, or keeping as much information as possible 


## Updating information

### 

- opposite direction: *updating* information on the basis of new
  arriving information 

- concept of *conditional probability*


### Example

- with knowledge of the underlying distribution, the information has
  to be updated, given that the occurrence of some event of the
  filtration is known 

. . .

- normal distribution with mean 2 

. . .

- incorporating the knowledge of a realization *greater than the mean*


### Unconditional density

![](/home/chris/research/teaching/riskMan/pics/intro_pics/generCondDens12.png)



### 

![](/home/chris/research/teaching/riskMan/pics/intro_pics/generCondDens13.png)


### 

Given the knowledge of a realization higher than 2, probabilities of
values below become zero:
	
![](/home/chris/research/teaching/riskMan/pics/intro_pics/generCondDens14.png)

### 

Without changing relative proportions, the density has to be rescaled
in order to enclose an area of 1:

![](/home/chris/research/teaching/riskMan/pics/intro_pics/generCondDens15.png)

###

- original density function compared to updated conditional density

![](/home/chris/research/teaching/riskMan/pics/intro_pics/generCondDens16.png)


### Decomposing density

![](/home/chris/research/teaching/riskMan/pics/intro_pics/uncondDecomp20.png)


### 

![](/home/chris/research/teaching/riskMan/pics/intro_pics/uncondDecomp21.png)


### 

![](/home/chris/research/teaching/riskMan/pics/intro_pics/uncondDecomp22.png)


### 

![](/home/chris/research/teaching/riskMan/pics/intro_pics/uncondDecomp23.png)

