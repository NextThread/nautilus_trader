# -------------------------------------------------------------------------------------------------
# <copyright file="data.pxd" company="Nautech Systems Pty Ltd">
#  Copyright (C) 2015-2019 Nautech Systems Pty Ltd. All rights reserved.
#  The use of this source code is governed by the license as found in the LICENSE.md file.
#  https://nautechsystems.io
# </copyright>
# -------------------------------------------------------------------------------------------------

from nautilus_trader.model.identifiers cimport Symbol
from nautilus_trader.model.objects cimport Tick, Bar, BarType
from nautilus_trader.serialization.base cimport DataSerializer, InstrumentSerializer


cdef class Utf8TickSerializer:
    """
    Provides a tick serializer for the UTF-8 specification.
    """
    @staticmethod
    cdef bytes serialize(Tick tick)
    @staticmethod
    cdef Tick deserialize(Symbol symbol, bytes values_bytes)


cdef class Utf8BarSerializer:
    """
    Provides a bar serializer for the UTF-8 specification.
    """
    @staticmethod
    cdef bytes serialize(Bar bar)
    @staticmethod
    cdef Bar deserialize(bytes bar_bytes)
    @staticmethod
    cdef list deserialize_bars(bytes[:] bar_bytes_array)


cdef class BsonDataSerializer(DataSerializer):
    """
    Provides a serializer for data objects to BSON specification.
    """


cdef class DataMapper:
    """
    Provides a data mapper for data objects.
    """
    cdef InstrumentSerializer instrument_serializer

    cpdef dict map_ticks(self, list ticks)
    cpdef dict map_bars(self, list bars, BarType bar_type)
    cpdef dict map_instruments(self, list instruments)


cdef class BsonInstrumentSerializer(InstrumentSerializer):
    """
    Provides an instrument serializer for the MessagePack specification.
    """
