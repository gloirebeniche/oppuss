//const String urlBase = "http://10.10.10.20:8000/api/";

const String urlBase = "https://oppuss.numericdevsoft.site/api/"; // CETTE URL POINT VERS L'API

// API URL SUR LE PACKAGES GESTION DES COMPTEhttps://oppuss.numericdevsoft.site/api/referentiel-btp/domaines/
const String apiAuthentification = '${urlBase}auth';
const String apiLogin = '$apiAuthentification/login/';
const String apiLogout = '$apiAuthentification/logout/';
const String apiRegister = '$apiAuthentification/employeur/register/';
const String apiGetCurrentUser = '$apiAuthentification/employeur/get-current-user/';

// API URL SUR LE PACKAGES REFERENTIEL DU BTP
const String apiReferentielBTP = '${urlBase}referentiel-btp';

const String apiDomaines = '$apiReferentielBTP/domaines';
const String apiTravaux = '$apiReferentielBTP/travaux';
const String apiMetier = '$apiReferentielBTP/metier';
const String apiGetWorkerByTravaux = '$apiReferentielBTP/get-worker-by-tash/';


// API URL SUR LE PACKAGES GESTION DES OFFRES
const String apiGestionOffres = '${urlBase}gestion/offres';

const String apiOffres = '$apiGestionOffres/offres/';
const String apiOffreArchive = '$apiGestionOffres/offres-archive/';
const String apiCommentaire = '$apiGestionOffres/commentaires/';
const String apiReservation = '$apiGestionOffres/reservations/';
const String apiAppreciation = '$apiGestionOffres/appreciations/';

// API URL SUR LA RÉCUPERATION DE TOUS LES OUVRIER
const String apiGestionCompte = "${urlBase}gestion/compte";
const String apiGetWorkers = '$apiGestionCompte/workers/';
const String apiGetEmployeurs = '$apiGestionCompte/employeurs/';

