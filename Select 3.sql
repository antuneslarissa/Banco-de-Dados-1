SELECT v.nr_placa, ma.ds_marca, mo.ds_modelo, cor.ds_cor, v.nr_ano_mod,
 v.nr_ano_fab, v.qt_km_rodado, v.qt_portas, a.ds_acessorio, c.ds_combustivel
FROM  veiculo v, marca ma, modelo mo, veiculo_acessorio va, acessorio a, combustivel c, veiculo_combustivel vc, cor
WHERE v.cd_modelo = mo.cd_modelo
AND mo.cd_marca = ma.cd_marca
AND v.nr_placa = va.nr_placa
AND va.cd_acessorio = a.cd_acessorio
AND v.nr_placa = vc.nr_placa
AND vc.cd_combustivel = c.cd_combustivel
AND v.cd_cor = cor.cd_cor