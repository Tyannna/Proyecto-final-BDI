-- A Cantidad de reservas realizadas a nombre de un empleado 
-- B Detalles de las reservas realizadas a nombre del empleado en cuestion 

Select count (*)

from Aerolinea.reservas r, aerolinea.vendedores v
where v.ID_Vendedores = r.ID_Vendedor
and r.ID_Vendedor = 17

select v.nombre, v.apellido, r.fecha_reserva, r.clase_vuelo, c.Nombre, c.Apellido, r.ID_cliente
from Aerolinea.reservas r, aerolinea.vendedores v, aerolinea.clientes c
where v.ID_Vendedores = r.ID_Vendedor
and c.ID_cliente = r.ID_Cliente
and r.ID_Vendedor = 17

--Reservas agendadas para el 17 de noviembre de 2020 que salen de la ciudad de medellin

select v.ID_vuelo ,r.ID_reserva, v.Origen, r.Fecha_reserva 


from aerolinea.vuelos v, aerolinea.reservas r, aerolinea.Reservas_vuelos RV

where RV.reservas_ID_reserva = r.id_Reserva and RV.Vuelos_ID_vuelo = v.ID_vuelo and
v.Origen in ('MEDELLIN') and r.Fecha_reserva = '2020-11-17'

--Listado de las reservas cuyo pago no ha sido completado, y la siguiente información de el cliente: Nombre, apellido, e-mail

Select  r.id_reserva,  p.Estado_pago,  c.nombre, c.apellido, c.email

from aerolinea.reservas r, aerolinea.pagos p, aerolinea.clientes c , aerolinea.Pagos_reservas PR

where PR.Pagos_ID_Pago = p.ID_Pago and PR.Reservas_ID_reserva = r.ID_reserva and

r.ID_Cliente = c.ID_cliente and p.Fecha_pago is null

order by r.id_reserva

-- Pilotos que conducen los vuelos que salen de la ciudad de Bogota y el modelo del avion 

Select distinct p.cedula,  p.nombre, p.apellido, v.origen, v.modelo

from aerolinea.vuelos v, aerolinea.pilotos p

where v.origen in ('BOGOTA')

-- Reserva realizada por el cliente con ID 20 y estado de la reserva

Select r.id_reserva, r.estado_reserva, r.ID_cliente, c.Nombre, c.Apellido

from aerolinea.reservas r, aerolinea.clientes c

where r.ID_Cliente = c.ID_cliente and r.ID_Cliente = 20

-- Reservas realizadas para vuelos que salen de la ciudad de barranquilla entre Oct y Nov del 2020 

select r.ID_reserva, v.ID_vuelo , v.Origen, r.Fecha_reserva 


from aerolinea.vuelos v, aerolinea.Reservas r, aerolinea.reservas_vuelos rv 

where rv.Reservas_ID_reserva = r.ID_reserva and rv.vuelos_ID_vuelo = v.ID_vuelo and
v.origen like '%BARRANQUILLA%' and (r.Fecha_reserva between '2020-10-01' and '2020-11-30')

order by r.id_reserva