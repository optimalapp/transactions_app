every 1.minute do
  runner 'DeletingTransactions.perform_async'
end
