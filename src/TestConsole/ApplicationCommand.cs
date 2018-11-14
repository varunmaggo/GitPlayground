﻿using Git.Domain;
using Git.Domain.Models.TFL;
using System;
using static Git.Domain.Constants.AccidentStatisticSorting;

namespace TestConsole
{
    public class ApplicationCommand : IApplicationCommand
    {
        private const int PageSize = 20;
        private readonly ITransportForLondonClient _transportForLondonClient;
        private readonly ILogger _logger;

        public ApplicationCommand(ITransportForLondonClient transportForLondonClient, ILogger logger)
        {
            this._transportForLondonClient = transportForLondonClient;
            this._logger = logger;
        }

        public void Execute()
        {
            int currentPage = 1;
            int currentAmountOfRecordsRetrieved = PageSize;
            Paged<AccidentStatistic> pagedAccidentStatistics;
            do
            {
                pagedAccidentStatistics = GetPagedFatalAccidentStatisticsFor2014To2017(currentPage, ByDateDescending);
                _logger.AsInformation($"{pagedAccidentStatistics.Total} fatal accidents occured");
                _logger.AsInformation($"Page '{pagedAccidentStatistics.Page}' of '{pagedAccidentStatistics.LastPage}' pages with {currentAmountOfRecordsRetrieved} records");
                foreach (var accidentStatistic in pagedAccidentStatistics.Data)
                {
                    _logger.AsData($"{Enum.GetName(typeof(Severity), accidentStatistic.Severity)} Accident occured on '{accidentStatistic.Date.ToLongDateString()} {accidentStatistic.Date.ToLongTimeString()}' at '{accidentStatistic.Location}' with severity '{accidentStatistic.Severity}'");
                }
                _logger.AsInformation($"Next '{PageSize}' records ...");
                currentPage += 1;
                currentAmountOfRecordsRetrieved += pagedAccidentStatistics.PageSize;
                Console.Read();

            } while (pagedAccidentStatistics.NextPage.HasValue);
        }

        private Paged<AccidentStatistic> GetPagedFatalAccidentStatisticsFor2014To2017(
            int page,
            SortOptions<AccidentStatistic> sortOptions)
        {
            return _transportForLondonClient.GetAccidentStatistics(
                    from: DateTime.Parse("01 January 2014 00:00:00"),
                    to: DateTime.Parse("31 December 2017 00:00:00"),
                    severity: Severity.Fatal,
                    sortOptions: sortOptions,
                    page: page,
                    pageSize: PageSize)
                .GetAwaiter()
                .GetResult();
        }
    }
}