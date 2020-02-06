# Prefactibilidad


prefGetClientPolygon () {
  # Obtiene el datasource del polígono del cliente para un proyecto dado

	if [[ -z $1 ]]; then
		echo "Usage:"
		echo "prefGetClientPolygon <projectId>"
    return 1
	fi

	projectId=$1
	psql -t -d ${DB_NAME:=prefactibilidad} -c "select datasource from layer l join map m on l.id = m.layer_id where m.id = $projectId"
}
