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

 


