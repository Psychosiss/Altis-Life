_notice = [];
_civ = 
[format
	[
		"Tu veux devenir policier, %1?,<br/><br/>
		<t color='#FF0000'>La police des Crunchs</t> est chargé de rassurer et d'aider les habitants d'Altis. Si tu veux faire respecter la lois et la justice 
		en nous rejoingant tu es sur la bonne voie.<br/><br/>Nous recrutons à partir de 19 ans, tu trouvera toutes les informations sur notre forum! Une présentation 
		civil te donnera accès à la section recrutement de police<br/><br/Une fois posté ta candidature sera étudier et soumise à un vote (1 semaine), si celui ci est concluant
		tu rejoindra nos rang en temps que recrue.<br/><br/>La police est un role TRES IMPORTANT chez Les Crunchs.
		Tu dois protéger les habitants dans plusieurs sitation difficile, surveiller les actions rebelles, les braquage de réserve fédérale, les évasions de prison et beaucoup d'autres!<br/><br/>
		La police posséde beaucoup d'équipement spécialise pour la sécurisation des habitants.<br/><br/>Si tu pense convenir au critère 
		tu es prêt pour te rendre sur <t color='#4444FF'>www.les-crunchs.comxa.com</t>.  et rejoindre nos force de police.", name player
	]
];

{
	_notice = _notice + [(parseText _x)];
} forEach _civ;
_civ = _notice;
"Rejoindre la Police!" hintC _civ;