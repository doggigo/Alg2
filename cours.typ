#import "@local/utils:0.1.0": *
#import "@local/doc_fac:0.1.0" as theme_colors
#import "@local/doc_cours_nb:0.1.0" as theme_nb

#let theme_default = "colors"

#let theme_name = sys.inputs.at("theme", default: theme_default)


#let theme = if theme_name == "colors" { theme_colors } else { theme_nb }

#let theorem = theme.theorem
#let corollary = theme.corollary
#let lemma = theme.lemma
#let property = theme.property
#let proposition = theme.proposition
#let exercice = theme.exercice
#let example = theme.example
#let notation = theme.notation
#let remark = theme.remark
#let method = theme.method
#let definition = theme.definition
#let vocabulary = theme.vocabulary
#let proof = theme.proof

#let only-thms = sys.inputs.at("only-thms", default: "false") == "true"

#show: theme.doc_fac.with(
  title: "Cours Alg2",
  numbering: "I. 1. 1. a) i)",
  show-examples: not only-thms,
  show-exercises: not only-thms,
  show-proofs: not only-thms,
  page-numbering: "1",
)

#show: setup_maths.with()

#outline()

= Presentations

*Professeur* : Thomas Dedieu

CCs :
- CC1 : Preuves en TD

= Actions de groupes

_"Un groupe, c'est fait pour agir."_

#definition[
  Un *groupe* G est un ensemble muni d'une loi de composition interne (lci), notée "$.$", telle que :
  - $.$ est associative : $forall g, h, k in G, (g . h) . k = g . (h . k) = g . h . k$
  - Il existe un élément neutre : $exists e in G, forall g in G, e . g = g . e = g$ 
    
    (on la note parfois $1$, $1_G$, $0$, ou $id$)
  - Tous les éléments possèdent un inverse : $forall g in G, exists h in G, g . h = h . g = e$.
    
    Ce $h$ est automatiquement unique, et on le note $g^(-1)$ ou $-g$ selon si l'on est en notation multiplicative ou additive.

  On ne demande pas la commutativité, sinon on parle de groupe _commutatif_ ou _abélien_.
]

#example("série I, symétries")[
  - Pour tout ensemble $X$, l'ensemble $SSSSS(X)$ des applications $f : X --> X$ bijectives muni de la loi $compose$ de composition est un groupe.

    Si $X$ est fini de cardinal $n$, alors : $ SSSSS(X) isommorphic SSSSS({1,...,n}) $ (isomorphisme)

    noté $SSSSS_n$, groupe symétrique sur $n$ éléments, et d'ordre $n!$

    Les éléments de $SSSSS_n$ sont appelées permutations.

  - Toute une galaxie de variantes obtenues en demandant de respecter une structure sur $X$ :
    - Pour $X$ un espace topologique, $hom(X) = {f in SSSSS(X) | f,f^(-1) "continues"}$
    - Pour $X$ un espace métrique, $"isom"(X) = $ groupe des isométries de $X --> X$.
    - Pour $E$ un espace vectoriel, le groupe général linéaire $GL(E) = {f in SSSSS(E), f "linéaire"}$
]

#example("série II, groupes de nombres")[
  - $(ZZ,+)$ est un groupe
  - Pour $n in NN^*$ fixé, $(ZZ\/n ZZ,+)$ est un groupe avec la lci $+$ induite par l'addition de $ZZ$.
  - Si $KK$ est un corps, $(KK^*,times)$ est un groupe
  - $(UU_n(CC),times)$ est un groupe avec $UU_n$ les racines n-ièmes de l'unité. (il est isomorphe à $ZZ sur n ZZ$)
  - Si $(A,+,times)$ est un anneau, $(A^x,times)$ est un groupe. (où $A^x$ est l'ensemble des inversibles par $A$)
]

#example[
  Pour $A = (ZZ sur 8 ZZ,+,times)$, $k^F$ inversible dans $A$ ssi $k and 8 = 1$

  $(ZZ sur 8 ZZ)^x = {1^F,3^F,5^F,7^F}$

  Tous les elements sauf $1$ sont d'ordre $2$, $(a^F,b^F) in in ZZ sur 2 ZZ times ZZ sur 2 ZZ mapsto (-1)^a 3^b in ZZ sur 8 ZZ$ est un isomorphisme de groupes.
]

== Philosophie de l'action

Étant donné un groupe arbitraire, on le fait agir sur un ensemble de notre choix pour le comprendre en termes de symétries.

#example[
  $(ZZ sur n ZZ,+)$ agit sur le plan par rottions d'angles multiples de $(2 pi)/n$

  C'est-à-dire qu'on regarde $k^F mapsto "Rot"(D,(2 k pi)/n)$ rotation de centre $D$ d'angle $(2 k pi)/n$, un morphisme de $ZZ sur n ZZ$ dans $cases(SSSSS("plan"),GL_2(RR))$
]

*Deux intérêts duaux* :
  - On peut faire ça pour mieux cmprendre notre groupe
  - Pour comprendre les symétries d'un ensemble donné.

#example[
  Les isométries d'un tétrahèdre régulier forment un groupe isomorphe à $SSSSS_4$

  Celles d'un cube (ou octahedre régulier) est isomorphe à $SSSSS_4 times ZZ sur 2 ZZ$
]

#definition[
  Soient $G$ un groupe et $X$ un ensemble.

  Une *action* (à gauche) de $G$ sur $X$ est une loi de composition :
  $
  application(G times X,X,(g,x),g . x)
  $

  satisfaisant :
  + $forall g,h in G, forall x in X : g . (h . x) = (g h) . x$
  + $forall x in X : 1_G . x = x$
]

#proposition[
  La donnée d'une action à gauche de $G$ sur $X$ est équivalente à celle d'un morphisme de groupes de $G$ dans $SSSSS(X)$
]

#proof[
  À une action $G agit X$ on associe le morphisme $phi : application(G,SSSSS(X),g,(x in X mapsto g . x in X))$

  Soient $g,h in G$, 
  - montrons que $phi(g h) = phi(g) compose phi(h)$

    Soit $x in X$. Alors $phi(g h)(x) = (g h) . x$ et $[phi(g)phi(h)](x) = phi(g) (phi(h)(x)) = phi(g)(h . x) = g . (h . x)$.

    Par le premier axiome, on a l'égalité.
  -  De la même façon, en utilisant le second axiome, on montre que $phi(1_G) = id_X$ (exo)


  On en déduit que $phi(g)$ est bien une bijection pour tout $g$. En effet, $phi(g)phi(g^(-1)) = phi(g g^(-1)) = phi(1_G) = Id_X$

  Et de même, $phi(g^(-1))phi(g) = id_X$ donc $phi(g)$ est une bijection.

  À présent, on sait que $phi$ est bien une application $G --> SSSSS(X)$ et c'est un morphisme de groupe par le premier point que l'on a démontré.

  Pour aller dans la direction opposée, partant de $phi : G --> SSSSS(X)$, on définit : $ forall g, forall x in X, g . x = phi(g)(x) $

  (exo : mq c'est bien une action de groupes)
]

#exercice[
  Soient $X$ un ensemble, $u : X --> X$ une aplication.
  - S'il existe $v : X --> X$ tel que $u v = id_X$, alors $u$ est surjective.
  - S'il existe $v$ tel que $v u = id_X$, alors $u$ est injective.
]

#example[
  Action tautologique de $SSSSS_n$ sur ${1,...,n} = X = [n]$.

  On regarde $id_(SSSSS_n) : SSSSS_n --> SSSSS(X) = SSSSS_n$ (car $X = {1,...,n}$)

  d'apres la propriété précédente, ça donne une action $ SSSSS_n agit [n] $ dite tautologique. Concrètement : $forall sigma in SSSSS_n, forall k in [n], sigma . k = sigma(k)$

  Soit $k in [n]$ et notons $PPP_k (n)$ l'ensemble des parties à $k$ éléments de $n$.

  L'action tautologique de $SSSSS_n$ induit une action $
  SSSSS_n agit PPP_k (n)
  $ donné par : $
  forall sigma in SSSSS_n, forall I in PPP_k (n), sigma . I = sigma(I)
  $ (comme $sigma$ est bijective, $sigma(I)$ est de même cardinal que $I$)

  De cette façon, on obtient un morphisme $SSSSS_n --> SSSSS(PPP_k (n))$ où $PPP_k (n)$ est de cardinal $binom(n,k)$

  C'est-à-dire : $SSSSS_n --> SSSSS_(binom(n,k))$, lui est bien nouveau (et non tautologique).
]

#example[

  Soit $C$ un cube régulier, et $G = "Isom"(C)$, le groupe de ses isométries.

  On a une action tautologique $G agit C$.

  On prend $X$ l'ensemble des grandes diagonales du cube. Celles qui joignent deux sommets opposés.

  $Card(X) = 4$. 
  
  Une isométrie de $C$ doit envoyer toute grande diagonale sur une grande diagonale. On obtient ainsi une action $G agit X$, soit de maniére équivalente, un morphisme $phi : G --> SSSSS_4$.

  On montre que (on le fera un jour) :
  - $phi$ est surjectif
  - $ker(phi) isommorphic ZZ sur 2 ZZ$ (engendré par la symétrie centrale ce centre Le centre de $C$)
  
  Ceci permettra de montrer que $"Isom"(C) isommorphic SSSSS_4 times ZZ sur 2 ZZ$

]

#definition[
  Une action $G agit X$ est *fidèle* si : $ forall g in G, (forall x in X, g.x = x) ==> g = 1_G $
]

#example[

  Soit $V$ un espace vectoriel, $G = GL(V)$. Notons $PP(V)$ l'ensemble des droites vectorielles de $V$.

  Par définition, $G$ est un sous-groupe de $SSSSS(V)$, donc on a une action (tautologique) $G agit V$ 

  $G underbrace(<,"sous-groupe") SSSSS(V)$ donc on a un morphisme injectif $ j : application(G,SSSSS(V),g,g) $ l'action tautologique $G agit V$ est celle correspondant au morphisme $j$.

  Autrement dit : $forall f in GL(V), f in Lin(V)$. $forall x in V : f . x = f(x)$

  L'action tautologique induit une action sur $PP(V)$ : $forall f in GL(V), forall W in PP(V) = f.W = f(W)$. 
  
  $(i)$ : Comme $f$ est linéaire : $W$ sev $==> f(W)$ sev. 
  
  $(i i)$ : Puisque $f$ est un isomorphisme, $dim(f(W)) = dim(W)$

  En utilisant $(i) + (i i)$ : Si $W$ sev tq $dim(W) = 1$, alors $dim(f(W)) = 1$.

  #underline[Exo] : Ceci définit une action.

  - $GL(V) agit V$ est fidèle. En effet :
    
    Soit $f in GL(V)$ tel que $forall x in V, f.x = x$.

    De maniere équivalente : $forall x in V : f(x) = x$. Donc $f = Id_V = 1_(GL(V))$
  
  - $GL(V) agit PP(V)$ n'est pas fidèle :

    Soit $lambda in.not {0,1}$ un scalaire et posons $f = lambda id_V in GL(V)$ qui est une homothétie donc un isomorphisme.

    Pour tout sev $W$, $f(W) = W$. On a $f != 1_(GL(V)) = W$. Mais $forall W in PP(V) : f . W = W$ donc l'action n'est pas fidele.

]

#remark[
  Si $G agit X$ correspond à $phi : G --> SSSSS(X)$ : l'action est fidèle $<==> phi$ injectif. (preuve en TD).
] _Note : Cette remarque fait donc partie du cours_

#definition[
  Une action $G agit X$ est *transitive* si :
  $
  forall x,y in X, exists g in G "tq" g.x = y
  $

  Attention : La transitivité n'est pas équivalente à la surjectivité $phi : G --> SSSSS(X)$
]

#example[

  - $GL(V) agit V$ n'est pas transitive.

    Soit $x = 0_V$ et $y != 0_V$.

    Pour tout $f in Lin(V)$, $f(0_V) = 0_V$. Donc $forall f in GL(V) : f.x != y$.

  - $GL(V) agit PP(V)$ est transitive.

    Soit $x = E$, $y = F$ deux droites vectorielles.

    Soient $cases((u) "base de " E, (v) "base de " F)$

    Disons $dim V = m < infinity$ pour simplifier.

    On complète $(u)$ d'une part et $(v)$ d'autre part en deux bases $(u_1,dots,u_n)$ et $(v_1,dots,v_n)$.

    "On sait bien que" : 

    Il existe un unique isomorphisme linéaire $f : V --> V$ tel que $f(u) = v$, $f(u_i) = v_i$,$forall i = ,...,n$.

    Cet $n$ est tel que $f(E) = f(Vect(u)) = E = Vect(v)$. Donc $f . E = F$ et l'action est bien transitive. 

  - Considérons à présent $X = $ le plan affine, $G = $ le groupe des transformations affines de $X$

    ("Le groupe des bijections de $X$ préservant l'alignement", par exemple les translations, rotations, homothéties, réflexions et leurs composées)

    On a une action tautologique $G agit X$, et on va regarder l'action de $G$ sur les paires de droites de $X$.

    Cette action préserve le parallélisme donc l'action sur les paires de droitesn'est pas transitive.

    Si $x = (D,E)$ tq $D$ et $E$ parallèles et $y = (D^',E^')$ tq $D^'$ et $E^'$ sont sécantes.

    Dire que l'action préserve le parallélisme signifie : $forall g in G, g . (D,E)$ est une paire de droites parallèles.

    Donc $forall g in G : g . x != y$ ; ainsi l'action n'est pas transitive.

]

#definition[
  Soiemt $G agit X$ une action. et $x in X$.

  L'orbite de $x$ sous l'action de $G$ est $ { y in X | exists g in G, g . x = y } = {g . x | g in G} $ On la note $OOO_x$ (ou souvent $omega_x$)
]

#example[

  $G = (RR,+)$. On considère $G agit CC$ (le plan) par rotations :
  $forall theta in RR, forall z in CC : theta . z = z e^(i theta)$

  #underline[Exo : ] Montrer que c'est bien une action.

  Alors $OOO_z = $ le cercle centré en l'origine passant par $z$.

  // TODO: Faire l'illustration

  - action non-transitive : $g . z$ est toujours sur le cercle $OOO_z$
  - action non-fidèle : $2 pi$ agit trivialement.

]

#proposition[

  Soit $G agit X$ action. Les orbites de cette action forment une partition de $X$.

]

#remark("Rappel")[
  Une partition de $X$ est une famille $(Z_i)_(i in I)$ de sous-ensemble non-vides de $X$ tel que : 
  + $X = bigunion_(i in I) Z_i$
  + $forall i,j in I : i != j ==> Z_i inter Z_j = emptyset$
]

#lemma[
  Soient $omega$ une orbite, $x in omega$. Alors $omega = OOO_x$.
]

#proof("du lemme")[ $omega$ est une orbite donc il existe $y in X$ tel que $omega = OOO_y$. On veut montrer que $OOO_x = OOO_y$.

On a $x in O_y$ donc il existe $g in G$ tel que $x = g . y$

Montrons que $OOO_x subset OOO_y "puis" OOO_y subset OOO_x$ : 

Soit $z in OOO_x$. Alors il existe $h in G$ tel que $z = h . x = h . (g . y) = h g . y$ donc $z in OOO_y$. 

Soit $z in OOO_y$. Alors $exists h : z = h . y$. $x = g.y <==> y = g^(-1)x$ donc $z = h.(g^(-1) . x) = h g^(-1) . x$ et ainsi $z in OOO_x$.
]

#proof[

  Soit $x in X$. $x$ est dans une orbite, puisque :
  + $1_G . x = x$ donc $x in OOO_x$. Donc la réunion de toutes les orbites est $X$.
  + Soient $omega, omega^'$ deux orbites.
    Montrons par contraposée : $omega != omega^' ==> omega inter omega^' = emptyset$

    Soit $x in omega inter omega^'$, donc d'après le lemme, $omega = OOO_x = omega^'$. Donc $omega = omega^'$.

]

#remark[
  Les orbites de $G agit X$ sont les classes d'equivalences de la relation d'équivalence $RRR$ :
  $
  forall x,y in X : x RRR y <==> exists g in G "tel que " y = g . x 
  $
]

#exercice[
  Montrer que c'est bien une relation d'équivalence.
]

#exercice("Fait général, théorie des ensembles.")[
  Les classes d'équivalence d'une relation d'équivalence forment une partition.
]

#remark[
  Une action $G agit X$ est transitive ssi il y a une seule orbite pour cette action.
]

#exercice[
  Prouver la remarque précédente.
]

#example[
  $GL(V) agit V$ tautologique. Il y a deux orbites : $OOO_0 = {0}, OOO_x = V - {0}, forall x in V$.
  - $OOO_0 = {0}$ car $forall f in GL(V) : f(0) = 0$
  - Soit $f in GL(V)$ injective, donc $f(x) != 0, forall x != 0$. Donc $OOO_x subset V - {0}$

    Réciproquement, soit $y in V, y != 0$. Montrons que $y in OOO_x$. On complète $(x)$ et $(y)$ en deux bases $(x,x_2,dots,x_n)$ et $(y, y_2,dots,y_n)$.

    Il existe un unique $f in GL(V)$ tel que $f(x) = y, f(x_i) = y_i, forall i = 2,dots,n$.

    $y = f . x$ donc $y in OOO_x$.
]

#definition[
  On appelle action par conjugaison de $G$ l'action $G agit G$ définie par :
  $
  forall g in G quad forall h in G quad g.h = g h g^(-1)
  $
]

#proof("du fait que ça soit bien une action à gauche")[
  + $1.h = 1 h 1^(-1) = h$
  + Soit $h,k,g in G$. Alors : $ h. (k.g) = h.(k g k^(-1)) = h k g k^(-1) h^(-1) = h k g (h k)^(-1) = h k . g $

  Les classes de conjugaison de $G$ sont les orbites de l'action par conjugaison.
]

#example[
  Pour $sigma, sigma^' in SSSSS_n, sigma$ et $sigma^'$ sont conjuguées ssi les décompositions en produit de cycles à supports disjoints de $sigma$ et $sigma^'$ sont les mêmes.
]

#remark("Principe de conjugaison")[
  *Pour le voir plus en profondeur, lire D. Perrin - Cours d'algèbre, ou M. Audin - ???*

  Si $h in G$ est de type $T$ caractérisé par la donnée $D$, alors $g.h = g.h.g^(-1)$ est encore de type $T$ mais caractérisé par $g(D)$
]

#example[
  Si $T = $ transposition, h = $mat(1,2)$, $D = $le support ${1,2}$. $g h g^(-1)$ est la transposition de support ${g(1),g(2)}$
]

#example[
  $V = E osum F$ avec $dim E = p, dim F = n-p$

  $s in GL(V)$ défini par : $forall x in E, y in F, quad s(x+y) = x - y$. C'est une symétrie par rapport à $E$ dans la direction de $F$.

  Alors $T = $ symétrie par rapport à un sev de $V$ de dimension $p$ et $D = (E,F)$.

  Pour $g in GL(V)$ : $g s g^(-1)$ est la symétrie par rapport à $g(E)$ dans la direction de $g(F)$.

  // TODO: Illustrer

  Admettons $g(E) osum g(F) = V$ (vient de $f$ isomorphisme).

  Prenons $x^' in g(E), y^' in G(F)$, alors $(g s g^(-1))(x^' + y^') = g s (underbrace(g^(-1) (x^'), in E) + underbrace(g^(-1)(y^'), in F)) = g(g^(-1)(x^') - g^(-1)(y^')) = g g^(-1) (x^') - g g^(-1)(y^') = x^' - y^'$

  _"Faites-le vous même."_
]

== Quotient par un sous-groupe

En général :
Pour $X$ un ensemble, $~$ une relation d'équivalence sur $X$, on appelle $X sur ~$ quotient de $X$ par $~$ l'ensemble des classes d'équivalence de $~$

Pour $x in X, bar(x)= {x^' in X | x ~ x^'}$

== Corps des fractions d'un anneau intègre

Par exemple : $A = ZZ$ et $Frac(A) = QQ$

Soit $A$ un anneau intègre (dont le seul diviseur de $0$ est $0$) et commutatif

Soit $~$ la relation sur $A times (A without {0})$ définie par :
$
forall (a,b), (a^',b^') in A times A times (A without {0}) = QQQ \
(a,b) ~ (a^',b^') <==> a b^' = a^' b
$

C'est une relation d'équivalence
+ (réflexivité) Soit $(a,b) in QQQ$ on a bien $a b = a b$ donc $(a,b) ~ (a,b)$
+ (symétrie) Soient $(a,b),(a^',b^') in QQQ$. $(a,b)~(a^',b^') <==> a b^' = a^' b <==> a^' b = a b^' <==> (a^',b^') ~ (a,b)$
+ (transitivité) Soient $(a,b),(a^',b^'),(a^(''),b^(''))$. Supposons $(a,b) ~ (a^',b^')$ et $(a^',b^') ~ (a^(''),b^(''))$

On a $a b^' = a^'b$ et $a^' b^('') = a^('')b^'$

$a^' b^('') = a^('')b^' <==> a b a^' b^('') = a b a^('')b^' <==> a^' b (a b^'') = a b^'(a^('')b) <==> P (a b^('')) = P (a^'' b)$ avec $P = a^' b = a b^'$

Si $P != 0$, comme $A$ est intègre, $P (a,b) = P (a^('') b) ==> a b^'' = a^('')b$.

Si $P = 0$, alors $a^' b = a b^' = 0$. Comme $b,b^' != 0$ et $A$ intègre, $a = a^' = 0$

De plus, $a^' b^('') = a^'' b^'$, donc $a^('')b^' = 0$ et ainsi $a^('') = 0$ puisque $b^' != 0$ et $A$ intègre. On a donc $a = a^('') = 0$ et ainsi $a b^('') = a^('') b$

#definition[
  $Frac(A) = QQQ sur ~$ est le quotient de $QQQ = A times (A without {0})$ par la relation d'équivalence $~$.

  Pour tout $(a,b) in QQQ$, on note $a/b in Frac(A)$ la classe d'équivalence de $(a,b)$
]

On va munir $Frac(A)$ de deux opérations $+$ et $times$.
+ Soit $a/b, c/d$. On définit $a/b + c/d = (a d + b c)/(b d)$

  Pour montrer que cette definition est coherente, il faut vérifier qu'elle ne dépend pas des représentants.

  Soit $(a^',b^'),(c^',d^')$ tq $a^'/b^' = a/b, c^'/d^' = c/d$. Il faut montrer que $(a d + b c)/(b d) = (a^' d^' + b^' c^')/(b^' d^')$

  C'est equivalent à $(a d + b c)b^' d^' = (a^' d^' + b^' c^') b d$. On sait que $a b^' = a^' b, c d^' = c^' d$

  On a  : $ (a d + b c) b^' d^' = a d b^' d^' + b c b^' d^' = a b^' d d^' + c d^' b b^' = a^' b d d^' + c^' d b b^' $
  et $a^' d^' b d =+ b^' c^' b d = a^' b d d^' + c^' d b b^'$.

+ On définit $a/b times c/d = (a c)/(b d)$.

  Remarque : si $(a,b),(c,d) in QQQ$, on a $b != 0$ et $d != 0$ donc $ b d != 0$ car $A$ intègre, ainsi on a bien $(a c, b d) in QQ$

  Vérifions que ca ne dépend pas des choix des représentants.

  Soient $(a,b),(a^',b^') in QQQ$ tels que $a/b = a^'/b^', c/d = c^'/d^'$. Montrons que $(a c)/(b d) = (a^' c^')/(b^' d^')$