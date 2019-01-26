function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 25-Apr-2018 12:07:47.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 12xQ matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 10xQ matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0.00035567;0.00045647;0.00057545;0.00054546;0.00064417;0.00083837;0.00086233;0.00096107;0.0010467;0.00031172;0.00062985;0.00060465];
x1_step1.gain = [2.45572231369856;2.71652935991655;2.42079594439214;12.6306849607824;2.80490813484085;2.9732188943363;2.69259575345069;2.53633641144388;3.61864346826712;2.32399167694917;7.65960266194171;2.52616044390197];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.951192478826244;-1.9025153634819327;-1.9886999736984918;-1.7060432707589739;-1.6760166106579764;-1.6560997635421024;1.4714354563563232;-1.2188569525536312;1.1176224171121469;-1.0876551533192034;1.1511082431657196;1.0689904288950627;0.75696082135581244;-0.91047926196835183;-0.67896990394945644;0.48981587893271467;0.57900949023393933;-0.86202574601212689;-0.49319157401084529;0.62605074752989975;0.30009923008865691;0.36016127797726694;-0.063973350393610254;0.27071432123809991;-0.12575831369417961;0.077548309877051511;0.27002756951951201;0.29580890916936786;-0.045818449411390121;-0.45292946806490686;0.36937042936287651;0.49774711297807345;0.41557043975757957;0.68479444081594665;-0.62933882573402988;-0.93093224943201558;-0.58019645338717718;0.85008525697359028;1.1456937607444797;1.3060190043883366;-1.3295780055007298;-1.260981169944162;-1.4067735554819933;-1.2459469659564886;-1.7448206524195713;-1.7804454039718169;-1.6232539830895518;1.5344287269503127;1.8711529586038484;-2.1735902656528032];
IW1_1 = [0.53324011091058565 -0.18406956128851945 -0.68287953134199708 0.18346775582269881 0.4349284443299794 -0.64768515859830356 0.62183213067476584 0.29301149825947048 0.57183010027379477 0.55703329722190342 0.85499390868551217 -0.7162601372423345;1.5233651125989729 -0.7288826286052007 0.64423380843108802 -0.51351700363882757 -1.3060205829013178 0.51545511397424937 -0.54550767400358957 -0.33905782593389228 -0.79884819583700095 -0.16865335954382626 0.011124088037393291 -1.6856955857971132;0.93485054744646123 0.11917826606956025 -0.49002416224013218 0.42932435594007634 -0.65131560848754844 -0.22763209038972135 -0.27056587956551714 0.64749971461310818 -0.3979230634742606 -0.030726057948652519 0.45250093129816354 0.95246643828148747;0.72053725763706233 0.81820343420049857 0.52080641729279609 0.46428069395783511 0.056498701208909298 0.10082564263163064 -0.27611949604403008 0.89959137530121269 -0.41259986436005169 0.71979571972753464 -0.55491778254270452 -0.44161671732330043;0.19982094250002969 0.59951849596242535 -0.45209747554103613 0.66345175552763802 -0.24749392949482582 0.51875063234613095 -0.51629170213541564 -0.51205400461751416 0.75074783214427154 0.74979843090794795 -0.62938841673921775 0.58292154972547805;0.71028908472721752 -0.033723883798162789 0.40098829200134728 -0.09622684064391504 -0.18405665982513389 -0.75182902649894068 0.76742192834563916 0.71784425985792299 -0.52580381091962958 0.65723202745724674 0.014212540036433494 -0.7095059416708388;-0.078017660767044542 0.49111996654571871 0.27828884588200897 -0.92802839451498986 -0.90521364318875852 -0.43324703574790885 -0.99960244184490532 0.23835492126308414 -0.3284705960814393 -0.4440928809577171 -0.46912362154107018 0.072114137864665293;-0.23750569825761281 -1.0612029048040312 0.27395691505216491 0.41439022384051188 1.231161881201684 -0.19823358797899734 0.11930979167081429 -0.30730292540563559 -0.65427320803806377 -1.3217782746775142 -0.020463386734473836 0.43704711983520839;-0.14955863863734153 1.0577629414339442 1.2094272993727395 -0.5295517797854854 0.62068904425415816 -0.54533015067991597 0.09000138891861488 0.35889722651878458 0.65255632726867097 0.09692673583358509 0.29437324386077263 -1.4861164145836891;0.57860552494295214 0.68744428857306672 -0.26828482113938495 0.25780016845884235 1.3664070554483392 -0.48577664505862 -0.98717096205913013 0.16303345960760174 -0.58665199614842767 -0.73059202209091523 -0.51206344139825311 0.45668968096497342;0.43642513800024896 -1.2247773184706756 0.68194089674974512 0.32565008557594655 0.076051557290733138 1.7833564843232854 -0.59521877591269079 0.91705174129293232 0.44018442668977459 -0.40791438236280259 -0.52736252912343629 -0.13183086275344016;-0.40378661227868201 -0.096621264388157102 -0.75494159098709435 -0.49063273547809433 0.5600250790660215 -0.4458909297691025 -0.70521251580371935 -0.79727937838141172 -0.20361487334158904 -0.20566962063632516 -0.87151855044768511 -0.54006540193735886;-2.1658168374638227 1.5278674552750864 1.4103881914936853 0.23103715162500713 -0.53060074928322953 0.30194229020397195 -0.7995363285030751 -0.35488123772469704 0.74946279302391294 -0.026045806845140899 -0.72034952585033918 1.0599867044628617;0.42903045397769518 -0.66718285812626921 0.56937330850308765 0.17625014975999764 0.48293667258780276 0.19562180461412956 0.62663242663290042 0.22000715586993402 0.70522228407587373 0.77280650192615696 0.71040404685490632 0.68261006576989924;0.49181253254235352 -0.77528797076252354 -1.1083924184109655 0.46062013156581327 -0.19781844060194856 0.19104605994442764 -0.45278519497434183 1.1187113275460414 1.0114212422414848 -1.2733155481667289 -0.67694796962039505 -0.63090212492084286;-0.27685185482136732 -0.22336343283832716 0.37913058616051543 -0.34262871872159262 1.1636291449675116 -0.70558379296109464 -0.35963952839071595 -0.83350236683644907 0.10075027531772852 0.47282496630284326 0.6077175378656553 1.2513296632397999;-0.23439958165173611 1.0036711194388153 0.86595420521196886 0.2317678546373296 -0.14023720787350991 0.65913542829886274 0.27282119258772047 0.58024232452198599 -0.18345017977665407 0.99715304586444997 0.48903846401451312 -0.19199324438278367;0.82835741186645095 0.79783470528837697 -0.25213251424669375 -0.58413157744710764 -0.87200155271209812 0.54622075456899144 0.041497302243985706 0.022264016898671666 0.57656180038948912 0.77939301273296968 0.020235275560658125 0.29768139801913734;0.89664562250658553 -0.60940242087624419 -1.0254692785326751 -0.15217755235488017 -1.4319862864937878 0.3817174982249299 0.66447425163025198 0.72334207191696964 -0.72159710794751308 -1.1017332089674345 0.55290297287986379 0.31465307277854621;-0.70576120646153617 -0.23341659202599344 0.1407590569969529 0.49987729614282445 -0.85806234312437901 0.49500987882124164 0.63343047701989497 -0.62769452737904696 -0.33503984599683401 -0.71402286910966162 -0.78681983989111937 -0.32975553564962123;-0.38164703859817856 0.53399480691901702 -0.96349243338180479 0.17070253085070186 0.031372319835214386 0.471219951030594 0.72301744139459734 -0.50439231184880995 -0.56745291015656762 -0.45731099468158909 -0.50390229685356869 -0.59080581250260378;0.30355540435266853 -0.64659841631916792 -1.3239222258912886 -0.90095445179342271 1.0304436829679782 -0.11602162234299264 -0.50119855286519988 1.3226072255214412 0.26535195789903543 -0.14953463113816215 0.75069568680639354 0.25957368356039051;-0.3115934684356515 -0.1048003249016634 0.84436175312906336 0.90372813757732162 -0.29630297356964169 -0.12233225741123369 0.12506101166287772 -0.45371360280070444 1.0107201355099202 0.75300227119371288 0.86896690781698838 0.67170864359958471;-0.12198871405436224 0.60076703510590257 -0.99644093005127998 -1.1250139713342053 -0.80204224161439786 -0.027187250797415453 0.11862216463770968 -0.028483563051848005 0.25469478132057982 -0.5573229491287004 -0.58764852664101386 -0.26695882796000264;0.98443356191488474 0.20880101187040107 0.15098803984267098 -0.27134231632476474 0.45380363171748789 -0.52979461765905544 0.91240289604259761 -0.41787305600025593 0.1423735279081339 0.86482323009556761 0.75330555910860886 0.33660204702657154;0.30651538200226841 -0.22430683287122541 1.1297266358183553 -0.88581531692598092 -0.23193752067398715 -1.661624823234028 1.4267363996881903 1.3550645530135141 -0.21014098171452009 -0.55255279051137296 0.17308310013326272 -0.095741872638426928;-0.057019213783599573 -0.8617192063454342 -0.34659161325619181 -0.62881965182612809 -0.61728532412765047 -0.13779142871564648 0.70801467516443439 0.10761973599433837 -1.0056627396191431 -0.72935107000824262 -0.5187248732772991 0.078950240411611097;0.67232380670414549 -0.15139150059860437 -0.20501569571627493 -0.69530519448832873 -0.39170824142680821 -0.53200815074038932 -0.80490210017164787 -0.17061603163952996 -0.83435113599138766 0.10973476660070772 -0.82338955376287692 0.73060818598633659;-0.20390269295937025 0.037956387417213903 0.37306367869502688 0.36573325113952632 -0.19188075102163604 0.13225203294755594 0.58722431526457231 0.81970128342171 -0.39781549922995629 -1.3802442961710304 -0.70843987802226283 0.95155021905968284;-0.36543362850079425 -0.076367448615357755 -0.55083866606189746 -0.76656147462331647 -0.12626141915445674 0.55902664393115375 -0.78088922668106353 -1.3515364982314981 1.0967310061623836 1.3476945180164546 0.27080221683588696 -0.14595746410760918;0.90263980523938914 0.85274426180337526 -1.3041824836811171 -0.46124803460641667 0.96308165962025782 0.64464759723559284 0.425221007965981 -0.78516944360433338 0.40927151586314492 -0.80445834661212834 -0.82857982260080731 -0.12612212784291613;-0.95454748472091211 1.3140569205491897 0.37710212665237353 -0.70073292366299644 -0.48591046077768507 -0.385329779743528 -0.8458460166031776 0.76274877377136241 -0.0096198710330659028 0.7799423654558435 0.43820178725206982 0.41355541198968232;0.28874068253549423 -0.55841503908549739 1.1077388885511288 0.82097635706920469 -0.51205975007216853 0.050230746538042423 1.1124269777021261 -0.22505846931250362 0.53993048501417018 0.26375464990845177 0.34434493380169923 0.57611524118031276;1.2789346899862974 -1.2349664063729022 0.21366205143376255 0.080719210981836834 0.30731329637143928 -0.54097856206325723 1.4412947524471795 -1.9869258633877129 0.53146158247316366 0.3895097225240427 0.54409750727415984 0.58523251865203529;0.52497970038608355 0.85081287987551346 -1.3477306498160482 -0.64160389666290307 0.099323894364222731 0.37190564448642793 -1.4321492925491015 1.9011364037121647 -0.69282551841897821 -0.15107459738945525 0.13727904658283305 -0.56885933748151252;-1.2214293571841432 0.43529560134130679 -0.68844339892023476 -0.01678399199242913 0.63772526726289558 0.64379381220347465 -1.3415995991625915 -0.88805710055354192 1.2940325683570097 0.23393855401227898 0.7254027266593599 0.089267450125114278;-0.43503227477303719 -0.043503300548521084 -0.25305170848316499 0.4691844817375625 -0.050474131659524905 -1.3447250291285806 0.39457217930349137 -0.77946830232159403 0.19423007294976194 -0.84321635061198474 0.67457231795736949 0.56576983212662835;0.51825804919725971 0.74406413920977632 0.62905380403772193 -0.415209560208327 -0.23831788312910437 -0.43772455854191866 -0.045002579754019265 -0.528274465083722 0.92381422562315751 -0.45585708992810398 0.50628322023306749 -1.1960196543877348;-0.021071842649718037 0.14569528708096188 -0.26275590825752976 -0.26347790075158856 -0.078854381044703187 -0.74877175399935314 -0.70850150089504782 0.818296844286037 0.63187701548220321 -0.73300987274292551 -0.79424044853170805 -0.63929181340595342;0.044902591580668255 -0.61536211120565321 -0.10775613716075215 -0.71062286819934795 0.11663144831967619 -0.03270955626424326 0.52759688687520923 -0.93830206423906048 -0.83282848160242151 0.79700188742475719 0.51302984801046769 0.12958318185864634;-0.3120615985973666 -0.85051587959139252 0.39853947238268694 0.77927104308641548 0.34763432091343777 0.19498714437054163 0.31839748024937436 0.51999938132027268 -0.47473718508318807 -0.60052738937514794 0.53351209745086536 0.72650368884521233;-0.37474042346876613 0.96193794933916632 -0.26437316511623576 -0.78087035637430879 0.4044238722135659 -1.5384251505144828 1.2033102540480023 -0.65341413871506526 -0.72000784725196765 0.4809632348826467 0.72798068426249818 -0.1122230190325446;-0.24596244759987801 -0.85901038013521613 -0.46066505832463545 -0.080010645507910857 -0.14051893704636267 -0.32363316887375121 -0.89619076103485873 0.47676064470047091 -0.73361952099144145 -0.51390325140859505 -0.79348540427212799 -0.045035930160658495;-0.6792020374087866 -0.10387451490659119 -0.37503253696745364 -0.76213792545738213 -0.96305574357431734 -1.0405841167442038 -0.55153005752753392 0.65728773460149981 0.17328424999304126 -0.43763841346479432 0.36114553105540009 -0.66209434321406269;-0.7865167598505699 0.46767298012397801 0.81958040405254351 -0.080156726054591135 -0.37069837731483407 0.94877736884731489 0.79107994602361509 0.4912058547767067 -0.018218646477273396 0.20690751999439694 -0.048472430321934837 -0.49368864037835652;-0.70951254341765424 0.62461440912392507 -0.61079407766913074 -0.47273883339447131 1.0621417161791549 -0.21546292701274553 0.13319881496188227 -0.88045318640916592 0.82920043301815283 -0.7661548494608772 0.11638713627669081 0.61694608457775746;-0.74014252872524244 -0.72933504490877077 -0.38197198190824522 -0.058739498383891607 1.1642059670926554 -1.2745684706970024 0.23490650265180962 0.077432703698466193 -0.56622866771466318 -0.85743686907757999 0.10690071930569874 0.51700257719698062;1.0955027015871643 0.68213652315473483 1.0600833909048217 0.039202338421585534 0.61857918549620694 -1.3710394311282739 -0.71628754995193078 0.6202367306407669 0.96758561098857054 0.62922185324161439 -0.56879296179936356 -0.70841144614427787;-0.54684800244088183 0.65600287193178752 1.0017465799788825 -0.53419415497436529 0.61502507343587265 0.19521911440273754 1.3767023555982474 0.53924151090474304 -0.49815267595285329 0.47083691026794133 -0.80864309227343845 0.24105761591146257;-0.11845210394957978 -0.37585465950734942 0.60911054419184474 1.0873397315264204 -0.71739763869929507 -0.51330829223609409 0.66327036437461884 -0.049819897142713648 0.12167763635394441 -0.3729440750526069 0.29495929429060491 0.43832998797800315];

% Layer 2
b2 = [0.47049192150792513;-0.60124225838535272;0.36796802625775232;-0.41071756304730545;-0.37828289449949942;0.15644322913768882;0.13805017981917053;-0.37101975832003542;-0.96436312037103389;0.6517949913233122];
LW2_1 = [0.64048324489376784 -0.76938695782515465 -0.59451614617596826 0.68314647312984877 0.47934418273265017 0.18267628276212286 0.4992513249952038 -0.13909355184927386 0.63950147355629605 0.50880456765392035 -1.1496292357436813 0.56602412663893453 1.2704062993771812 0.61015942505720866 -0.64198083542925088 -0.31740613001731222 0.75119653468722591 0.031319773878847858 -1.4463655232711803 -0.20456252234898026 0.31761955106944317 0.41912176241941446 0.17497309944591005 0.033973310583716783 0.25794501391866664 -1.3442628181316425 0.72873273343867939 -0.09748434473977384 -0.76843906642703053 0.53841501486031329 1.1346562328635206 1.0614257080948664 0.30727546897823116 -1.4455086574029326 1.3542447894490399 1.8255827385793029 -0.41656195090696402 0.068968311071210292 0.70368325244222663 -0.58055878144854833 0.49336390515170542 1.4460050834859588 0.4833768198519261 0.29400886142614657 0.2663278878078994 0.49878444358196838 0.14541966693065972 0.068688575179521608 0.98346193285369277 0.055480921074941729;-0.016020724398738907 1.3122043729425805 0.70086073438174534 0.65569738406743872 -0.28971126693850208 -0.67877572681533493 0.80464779760475236 -0.61453030389083962 -0.27935070979190874 -0.025972616301903822 -1.015382935960641 -0.53872094447792329 -2.0572814076417885 0.13122027016435397 0.13636303152408089 0.17710430320659198 -0.84210449668964571 -0.96230007843283538 -0.87090917157541103 0.10633464202616587 -0.52298043001993388 0.77146138826585497 -0.89526431876407031 0.6851412633472499 0.15145615826093914 -0.49301399000000534 -0.93973155200446246 -0.11547478115964177 -0.46718538573769591 0.28058403106616703 -0.045473240153700113 -0.73419747907620447 0.36951085112049736 1.1063489487454523 1.0766277196493872 0.44263438956968865 0.73210281551258494 0.64568406397802258 0.59481577292087251 0.81377082438000947 0.63458966184229915 0.57142178596092752 -0.85808114934574986 0.18881413725124402 0.028025083682819956 -0.30567844353478468 0.75995471764891898 1.2017568092886792 -0.98672330364073613 -0.14211330872898509;0.24589965423799151 -0.20189241941799621 0.720911091424147 0.87879332150589184 -0.24496207891527327 0.51404588706979926 0.83879907599070436 -0.36693773851567207 -0.96645035915253952 0.11676019101417516 -0.81775399741525645 0.37390811374114236 -0.40810233314086258 -0.31671016003193764 -1.0524889130729134 0.27496630817050211 -0.44436249528719579 -0.37863915228567041 1.3693005135135499 0.61072020233804281 -0.39530256791313378 -0.87530385719972603 -0.29044478614304492 -0.65879086082810623 0.39217014890168733 0.6928061919491173 0.31531689123153744 -0.95809511171133122 0.92554800775456014 -0.98534586251515532 0.38050173415472205 -0.6271606266649441 1.0834384573657394 1.2817189477594664 -0.82591531839990817 -1.0732661609158527 0.60099502034638508 -0.70594327704149951 0.76690306214225346 -0.49191567401804442 0.90931488282525141 0.82575037323595302 -0.90135591520832703 0.69142128343596654 -1.0159637447331487 -0.87423008230443777 -0.21783241732866723 -1.5227584559564755 0.96933960314860623 -0.13285794447891508;-0.72210847829106473 1.2698160988353355 -0.72860488814868363 -0.47630826996192765 1.0093366772202177 -0.60122810408505545 0.83838330931576777 0.036355111539381132 1.0100377541930039 1.0697681845886686 0.56883022378673798 0.030606451892037166 -1.5724327505127562 0.29091242361482206 0.84781038007753828 -1.0863172544426343 -0.59650260697995217 -0.57697804894268767 0.31125191119598489 -0.59978690512685828 0.26561071296109323 1.3377431423924946 0.77637702628355632 0.75755048216672694 1.0057097851694692 0.95029711057536959 -0.73674194356484257 -0.77677901692747398 0.36905697062562426 -1.1595324311871587 1.4837258777210616 -1.1164322177592689 0.52686265108610097 -0.49574612928117506 1.236199855302758 -0.73811596179182204 -0.023414308490837199 1.1566454708600244 -0.68152172661130872 0.30509028305049352 0.14410571006960837 0.20412738129966521 -0.26171766156518811 0.47119007411934682 0.35179824154882561 -0.73530533428023381 0.67366914339620798 1.010951162318904 0.40453858273619314 0.34855078743447443;-0.53288641945015014 1.1773343155177007 0.87166035153896337 0.69087195429917792 0.058454649927560262 0.66363885119156762 0.25209522639144083 -0.86135833090536418 1.2528760615122756 0.30352747031947802 -1.1958033555400294 -0.070573428759250101 -0.11089191832604051 -0.14210852635339172 -0.94781617513992245 -0.58387840852914286 -0.52021707699600972 0.49028639850265271 -0.65867609481585487 -0.47894830937164717 -0.73493682339804434 -0.8566974415423827 0.75556492858860125 0.34739021993504976 0.061970248142084058 1.9175821718937367 0.58471170531269911 0.76006577352977467 -0.97412304645016623 0.12849223246383365 -0.61057076658310017 0.14071745828018653 -0.088977370022011379 0.7755672299891343 -1.7424549649318783 -1.2165792858547593 0.86599482243022485 0.58609861413909492 -0.89927384159568602 0.34333100556534996 -0.92942759023006571 0.74074993585107496 -0.50497440116877068 -0.09692992213073448 -0.31116778161241454 -0.1621926549319801 0.05157229886745076 0.40748931479219908 1.3277004268591743 -0.3745444074447008;-0.20441964490523756 0.56272902687336401 0.73602891412455906 0.35506002287095728 0.16221682652513808 -0.36320572905212184 -0.067855065888918945 -0.32916000059514333 0.53997059907039435 0.075852583167010032 1.6399171608201482 -0.2300822254110752 0.88662463061049313 0.13295602100107676 -0.91075103563774729 -0.63572153207382898 -0.68650961053116588 -0.30644147452197495 -1.0329710470478715 1.1295932567714237 -0.78438053974208166 -1.2218738566547134 -0.65157304059771137 -0.049235685069715929 0.2895682335014555 -0.4858394588845682 -0.68737120082205383 -0.26375559613001615 -0.40216405277713424 0.93028565014917919 -0.75094734280099307 0.094844397635930444 0.58799959992210538 -0.57455395261354603 -0.45947683280843987 0.079232833507030198 -0.56615261553751328 0.86204239289112583 -0.31332646644077511 -0.29719875628548753 -1.1054941028661802 -2.1934302963417567 -0.17163894351097914 0.50808089906086551 -0.12108942123565095 0.18144387712682758 -0.7054289802622048 -0.20059346033066625 0.59609878605933941 -0.25815490438522976;0.3460595619391505 -1.3284181653396672 0.94567323278402537 -0.21869357829407599 -0.64103056816899295 -0.31408221641858086 0.7850637418269375 0.16713021800177785 -0.079544489328507412 1.2693509348301466 0.34950246081993203 0.80454964953557351 0.56161826315640528 0.21110812633936227 0.90480116290023982 -0.28233685769759215 0.97026206775046075 -0.34231625313399028 -0.15325471397860221 0.48757468553366462 0.3656670689312701 0.66308332293643113 0.71494592963351555 -0.68128387531986523 0.14796763149404296 -1.2284735165797089 -0.47383747760968725 0.37999305177466686 0.22091931382341159 0.73763106152150004 0.47507469087355098 -0.39998888861484344 -0.61188267870054736 1.0225207599676736 -1.5152523005850653 1.7174489772902763 1.3152654736567622 -0.94936674213239036 -0.65298261797948531 0.25750549245450161 -0.46343269965292733 -0.54467167904233604 -0.62929888509315446 -0.9741378834863762 -0.13340237968174679 1.3644314802186661 0.63378344114347041 -0.44728354757451827 -0.15965778655193519 0.40358353937656238;0.69274471077397692 -1.1939622686777993 -0.34060253093554771 -0.080024789617584968 0.19117435054857942 -0.27718815379579909 -0.51670678040703144 0.75756047194812814 -0.45886106981505881 0.17367463950644391 -0.058823436164416563 -0.81115541820885328 -0.52177528723782873 -0.64755126010794051 1.074175985968741 0.6404179477534262 0.065282848598487958 0.037387990627165413 0.48541884330947377 -0.32464127786916425 -0.24582218135328573 1.0528899034058614 -0.47045341771029103 -0.65107614624854626 0.90627567203525883 0.48604145954392369 -0.3927484144276206 0.99188393867633473 0.40888472331573134 -1.317217522176984 -0.21038276885626539 0.27663806981337358 -0.28045196715373583 -1.4532034543635992 0.12580090365857061 0.019542668479593496 0.76479887344521036 -0.18525674900740413 -0.29052757220106051 0.72770885295210408 0.0052304513626767329 -0.056059313604545767 0.82626628616310116 -0.30160328714072271 0.2103100048415433 -0.72845437939222057 1.2612629189337896 -0.8880687124566693 1.0210878054435208 -0.60800643154655476;-0.60466742275098695 0.8599698521177217 -0.58429063411186 0.98834682950743913 -0.70036352551816705 0.78925957079302811 0.46808278392013397 -0.9318783897159415 -0.64899668037549341 -0.77852527998260124 0.28474644675559352 -0.38243274054937848 -1.1974559700785283 -0.77640871739137252 1.1662901216292574 -1.4581539641457302 0.61236190794514633 -0.2393006466863063 1.43237207915375 -0.27128365139355537 0.23047085940925219 0.17321641596738921 0.27997751138933552 0.42209067758975077 -0.72993608063047211 -1.2150807382004043 -0.87424435309950543 0.097943132420819215 0.14673557592054323 0.74354541148736131 1.116802822108018 -0.30353332972467395 -0.6619015007955259 0.25456328651210641 0.60347121796587044 -0.16177632608326054 -0.92895977452195111 -0.14577577637861361 0.25015183316267936 0.51143046977095341 0.10391423334561803 0.3038982139196223 -0.081508556039743316 -0.58752263567415774 0.34891289191933517 -0.41403270435499784 -1.6069725895543183 -1.0880432765798711 -0.44384397337064885 0.037954644670030527;0.34518442626120005 0.81559107961091071 -0.27468666280376652 -0.88315024187702229 -0.99051729867483607 0.32123561322273914 0.85242484136159458 -0.78766881130986455 0.36205288875820651 -0.73074961131789073 0.72255462763083533 0.083994353116269738 1.7080750485701797 0.40498663600068324 0.80375961366830528 -1.1940567374838322 0.63948760532438009 -0.83593907809935941 0.8842308701215299 -0.49820099070487883 -0.21085759908990442 0.33897462907595688 0.057894678764338334 -0.27985487643084711 0.81569305381802459 1.1015380083658723 -0.35051862158873215 0.017780635522616196 1.3532028476909312 -0.95870764991664637 -1.7890536784353765 1.2411809744830462 0.78955581419088139 -0.71552171128702868 0.97573813630386719 0.22176500422241674 0.32959761756895289 0.070473592944199762 0.024851952137196914 -0.3069808286267835 0.32200926702477184 -0.44292739774479178 -0.84587721566809726 -0.33250735848137003 -0.85135550373023161 0.11796434897865533 0.62343586918514682 0.21632134451980986 0.36360346700796792 -0.21737694058015744];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = softmax_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Output 1
    Y{1,ts} = a2;
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Competitive Soft Transfer Function
function a = softmax_apply(n,~)
if isa(n,'gpuArray')
    a = iSoftmaxApplyGPU(n);
else
    a = iSoftmaxApplyCPU(n);
end
end
function a = iSoftmaxApplyCPU(n)
nmax = max(n,[],1);
n = bsxfun(@minus,n,nmax);
numerator = exp(n);
denominator = sum(numerator,1);
denominator(denominator == 0) = 1;
a = bsxfun(@rdivide,numerator,denominator);
end
function a = iSoftmaxApplyGPU(n)
nmax = max(n,[],1);
numerator = arrayfun(@iSoftmaxApplyGPUHelper1,n,nmax);
denominator = sum(numerator,1);
a = arrayfun(@iSoftmaxApplyGPUHelper2,numerator,denominator);
end
function numerator = iSoftmaxApplyGPUHelper1(n,nmax)
numerator = exp(n - nmax);
end
function a = iSoftmaxApplyGPUHelper2(numerator,denominator)
if (denominator == 0)
    a = numerator;
else
    a = numerator ./ denominator;
end
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end
