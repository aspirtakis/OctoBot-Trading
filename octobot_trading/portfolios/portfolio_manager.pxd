# cython: language_level=3
#  Drakkar-Software OctoBot-Trading
#  Copyright (c) Drakkar-Software, All rights reserved.
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 3.0 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library.
from octobot_trading.portfolios.portfolio cimport Portfolio
from octobot_trading.portfolios.portfolio_profitability cimport PortfolioProfitability
from octobot_trading.exchanges.exchange_manager cimport ExchangeManager
from octobot_trading.portfolios.portfolio_value_holder cimport PortfolioValueHolder
from octobot_trading.traders.trader cimport Trader
from octobot_trading.util.initializable cimport Initializable


cdef class PortfolioManager(Initializable):
    cdef object logger

    cdef public dict config

    cdef public str reference_market

    cdef public ExchangeManager exchange_manager
    cdef public Trader trader

    cdef public PortfolioProfitability portfolio_profitability
    cdef public PortfolioValueHolder portfolio_value_holder
    cdef public Portfolio portfolio

    cpdef bint handle_balance_update(self, dict balance, bint is_diff_update=*)
    cpdef void clear(self)

    cdef void _load_portfolio(self)
    cdef void _set_starting_simulated_portfolio(self)
    cdef bint _refresh_simulated_trader_portfolio_from_order(self, object order)
