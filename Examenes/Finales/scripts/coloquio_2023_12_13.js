db.version()

plantel_docente= db.getCollection("facultad_plantel_docente")

plantel_docente.aggregate(
    [
        {$unwind: "$plantel"},
        { $group: {_id: {"legajo":"$plantel.legajo","nombre":"$plantel.apell_nombre"},
            "listado_departamentos":
                { $addToSet: {
                    "cod_dpto": "$cod_dpto",
                    "nombre_dpto": "$nombre_dpto",
                    }
                }
            },
        },
        {$match: {
            $expr: { $gte: [{ $size: "$listado_departamentos" }, 2] }
            }
        }
    ]
)


